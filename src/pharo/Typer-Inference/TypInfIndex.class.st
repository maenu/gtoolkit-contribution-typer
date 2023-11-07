Class {
	#name : #TypInfIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfIndex >> absCanResolve: aLookup message: aMessage [
	| resolved |
	resolved := aLookup resolve.
	resolved receiver isNamed ifFalse: [ ^ false ].
	resolved receiver hasClassDescription ifFalse: [ ^ false ].
	^ cache
		typAt: {#absCanResolve.
				resolved receiver classDescription.
				resolved selector}
		ifPresent: [ :m | 
			nil
				withArgs: {aLookup.
						aMessage}
				executeMethod: m ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
TypInfIndex >> absResolve: aLookup message: aMessage [
	| resolved |
	resolved := aLookup resolve.
	^ nil
		withArgs: {aLookup.
				aMessage}
		executeMethod: (cache
				typAt: {#absResolve.
						resolved receiver classDescription.
						resolved selector})
]

{ #category : #accessing }
TypInfIndex >> addBehavior: aBehavior [
	| variables |
	cache
		typAt: {#indexed.
				aBehavior}
		ifPresent: [ ^ self ]
		ifAbsentPut: [ true ].
	variables := aBehavior instanceVariables asIdentitySet.
	aBehavior isClass ifTrue: [ variables addAll: aBehavior classVariables ].
	variables
		ifNotEmpty: [ cache
				typAt: {#variables.
						aBehavior}
				put: variables ].
	aBehavior
		allSuperclassesDo: [ :b | 
			variables
				addAll: (cache
						typAt: {#variables.
								b}
						ifAbsent: [ self addBehavior: b.
							cache
								typAt: {#variables.
										b}
								ifAbsent: [ #() ] ]) ].
	variables
		do: [ :v | 
			cache
				typAt: {#writers.
						v}
				ifAbsentPut: [ IdentitySet new ] ].
	aBehavior methods do: [ :m | self addMethod: m ]
]

{ #category : #accessing }
TypInfIndex >> addMethod: aMethod [
	cache
		typAt: {#indexed.
				aMethod}
		ifPresent: [ ^ self ]
		ifAbsentPut: [ true ].
	cache
		typAt: {#variables.
				aMethod methodClass}
		ifPresent: [ :vs | 
			vs
				select: [ :v | v typInfIsWrittenIn: aMethod ]
				thenDo: [ :v | 
					(cache
						typAt: {#writers.
								v}
						ifAbsentPut: [ IdentitySet new ]) add: aMethod ] ].
	aMethod typInfAbsIsCanResolve
		ifTrue: [ aMethod typInfAbsCanResolve
				do: [ :selector | 
					cache
						typAt: {#absCanResolve.
								aMethod methodClass.
								selector}
						put: aMethod ] ].
	aMethod typInfAbsIsResolve
		ifTrue: [ aMethod typInfAbsResolve
				do: [ :selector | 
					cache
						typAt: {#absResolve.
								aMethod methodClass.
								selector}
						put: aMethod ] ].
	(cache
		typAt: {#implementors.
				aMethod selector}
		ifAbsentPut: [ IdentitySet new ]) add: aMethod methodClass.
	aMethod overriddenMethods
		do: [ :m | 
			(cache
				typAt: {#overriders.
						m}
				ifAbsentPut: [ IdentitySet new ]) add: aMethod ]
]

{ #category : #accessing }
TypInfIndex >> implementors95Quantile [
	| values |
	values := ((cache at: #implementors) values collect: #size) sorted.
	^ values at: (values size * 0.95) floor
]

{ #category : #accessing }
TypInfIndex >> implementors: aSymbol [
	^ cache
		at: #implementors
		at: aSymbol
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfIndex >> initialize [
	super initialize.
	{ProtoObject} , ProtoObject allSubclasses , {ProtoObject class}
		, ProtoObject class allSubclasses do: [ :b | self addBehavior: b ]
]

{ #category : #accessing }
TypInfIndex >> inlCanResolve: aLookup message: aMessage [
	| resolved methods |
	resolved := aLookup resolve.
	aMessage context stackSize < TypInfCurrentConfiguration value maxNodeStackSize
		ifFalse: [ ^ false ].
	(aMessage couldBeSelfOrSuperSend or: [ aMessage hasNodes ])
		ifFalse: [ ^ false ].
	resolved receiver isNamed ifFalse: [ ^ false ].
	resolved receiver hasClassDescription ifFalse: [ ^ false ].
	(resolved receiver classDescription canUnderstand: resolved selector)
		ifFalse: [ ^ false ].
	methods := self inlMethods: aLookup.
	self flag: 'Q inline some of it, lookup the rest, like for variables?'.
	(methods size between: 1 and: TypInfCurrentConfiguration value maxImplementors)
		ifFalse: [ ^ false ].
	^ methods
		anySatisfy: [ :a | a value size <= TypInfCurrentConfiguration value maxMethodSize ]
]

{ #category : #accessing }
TypInfIndex >> inlMethods: aLookup [
	| method |
	method := aLookup receiver classDescription lookupSelector: aLookup selector.
	method isAbstract ifFalse: [ ^ {aLookup -> method} ].
	^ (aLookup self overriders: aLookup selector)
		flatCollect: [ :m | self inlMethods: (aLookup withReceiver: m methodClass typAsType) ]
		as: Set
]

{ #category : #accessing }
TypInfIndex >> inlResolve: aLookup message: aMessage [
	^ (self inlMethods: aLookup)
		collect: [ :a | 
			(a key resolver isKindOf: TypInfMethodResolver)
				ifTrue: [ | node |
					node := [ a value ast ]
							on: OCUndeclaredVariableWarning
							do: [ :e | e resume: e declareUndefined ].
					TypInfInlContext
						sender: aMessage context
						state: aMessage state
						node: node
						lookup: a key
						message: aMessage ]
				ifFalse: [ TypInfInlLookupContext
						sender: aMessage context
						state: aMessage state
						node: aMessage node
						lookup: a key
						message: aMessage ] ]
]

{ #category : #accessing }
TypInfIndex >> methodSize95Quantile [
	| values |
	values := (Smalltalk globals allMethods collect: #size) sorted.
	^ values at: (values size * 0.95) floor
]

{ #category : #accessing }
TypInfIndex >> overriders: aCompiledMethod [
	^ cache
		at: #overriders
		at: aCompiledMethod
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfIndex >> removeBehavior: aBehavior [
	cache
		typAt: {#indexed.
				aBehavior}
		ifPresent: [ cache
				typRemoveAt: {#indexed.
						aBehavior} ]
		ifAbsent: [ ^ self ].
	(cache
		typAt: {#variables.
				aBehavior})
		do: [ :v | 
			(cache at: #variables) removeKey: v ifAbsent: [  "noop" ].
			(cache at: #writers) removeKey: v ifAbsent: [  "noop" ] ].
	aBehavior methods do: [ :m | self removeMethod: m ]
]

{ #category : #accessing }
TypInfIndex >> removeMethod: aMethod [
	cache
		typAt: {#indexed.
				aMethod}
		ifPresent: [ cache
				typRemoveAt: {#indexed.
						aMethod} ]
		ifAbsent: [ ^ self ].
	aMethod typInfAbsIsCanResolve
		ifTrue: [ aMethod typInfAbsCanResolve
				do: [ :selector | 
					cache
						typAt: {#absCanResolve.
								aMethod methodClass.
								selector}
						ifPresent: [ :s | s remove: aMethod ] ] ].
	aMethod typInfAbsIsResolve
		ifTrue: [ aMethod typInfAbsResolve
				do: [ :selector | 
					cache
						typAt: {#absResolve.
								aMethod methodClass.
								selector}
						ifPresent: [ :s | s remove: aMethod ] ] ].
	cache
		typAt: {#implementors.
				aMethod selector}
		ifPresent: [ :s | s remove: aMethod methodClass ].
	aMethod overriddenMethods
		do: [ :m | 
			cache
				typAt: {#overriders.
						m}
				ifPresent: [ :s | s remove: aMethod ifAbsent: [  "noop" ] ] ]
]

{ #category : #accessing }
TypInfIndex >> writers95Quantile [
	| values |
	values := ((cache at: #writers) values collect: #size) sorted.
	^ values at: (values size * 0.95) floor
]

{ #category : #generated }
TypInfIndex >> writers: aVariable [
	^ cache
		at: #writers
		at: aVariable
		ifAbsent: [ #() ]
]
