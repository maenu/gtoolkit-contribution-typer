Class {
	#name : #TypInfIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfIndex >> absCanResolve: aLookup message: aMessage [
	| classDescription |
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	classDescription := aLookup receiver classDescription.
	^ cache
		typAt: {#absCanResolve.
				aLookup receiver classDescription.
				aLookup selector}
		ifPresent: [ :s | 
			s
				allSatisfy: [ :m | 
					nil
						withArgs: {aLookup.
								aMessage}
						executeMethod: m ] ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
TypInfIndex >> absResolve: aLookup message: aMessage [
	^ (cache
		typAt: {#absResolve.
				aLookup receiver classDescription.
				aLookup selector})
		collect: [ :m | 
			nil
				withArgs: {aLookup.
						aMessage}
				executeMethod: m ]
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
					(cache
						typAt: {#absCanResolve.
								aMethod methodClass.
								selector}
						ifAbsentPut: [ IdentitySet new ]) add: aMethod ] ].
	aMethod typInfAbsIsResolve
		ifTrue: [ aMethod typInfAbsResolve
				do: [ :selector | 
					(cache
						typAt: {#absResolve.
								aMethod methodClass.
								selector}
						ifAbsentPut: [ IdentitySet new ]) add: aMethod ] ].
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
TypInfIndex >> contextAsyncAt: aLookup for: aDuration [
	| configuration |
	configuration := TypInfCurrentConfiguration value.
	^ [ TypInfCurrentConfiguration
		value: configuration
		during: [ self contextAt: aLookup ] ] asAsyncFuture typAwaitFor: aDuration
]

{ #category : #accessing }
TypInfIndex >> contextAsyncUpdateAt: aLookup for: aDuration [
	self contextRemoveAt: aLookup.
	^ self contextAsyncAt: aLookup for: aDuration
]

{ #category : #accessing }
TypInfIndex >> contextAt: aLookup [
	| context |
	cache
		typAt: aLookup typInfAsContextPath
		ifPresent: [ :c | 
			TypInfNodeStack actives size + 1 < c nodeStackDepth
				ifTrue: [ self contextRemoveAt: aLookup ]
				ifFalse: [ ^ c ] ].
	context := aLookup compiledMethod ast
			typInfContextSelf: aLookup root self
			super: aLookup root super.
	context canRun ifFalse: [ ^ context ].
	cache typAt: aLookup typInfAsContextPath put: context.
	[ context run ] ifCurtailed: [ self contextRemoveAt: aLookup ].
	^ context
]

{ #category : #accessing }
TypInfIndex >> contextRemoveAt: aLookup [
	^ cache typRemoveAt: aLookup typInfAsContextPath
]

{ #category : #accessing }
TypInfIndex >> contextUpdateAt: aLookup [
	self contextRemoveAt: aLookup.
	^ self contextAt: aLookup
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
	| methods |
	aMessage context stackSize < TypInfCurrentConfiguration value maxNodeStackSize
		ifFalse: [ ^ false ].
	(aMessage couldBeSelfOrSuperSend or: [ aMessage hasNodes ])
		ifFalse: [ ^ false ].
	aLookup receiver isNamed ifFalse: [ ^ false ].
	aLookup receiver hasClassDescription ifFalse: [ ^ false ].
	(aLookup receiver classDescription canUnderstand: aLookup selector)
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
	| method |
	method := aLookup receiver classDescription lookupSelector: aLookup selector.
	^ (self inlMethods: aLookup)
		collect: [ :a | 
			(a key resolver isKindOf: TypInfMethodResolver)
				ifTrue: [ | node |
					node := [ a value ast ]
							on: OCUndeclaredVariableWarning
							do: [ :e | e resume: e declareUndefined ].
					aMessage contexts
						detect: [ :cc | (cc isKindOf: TypInfInlContext) and: cc node = node ]
						ifFound: [ :cc | cc adoptSelf: aLookup self super: aLookup super ]
						ifNone: [ TypInfInlContext
								sender: aMessage context
								state: aMessage state
								node: node
								self: aLookup self
								super: aLookup super
								lookup: a key
								message: aMessage ] ]
				ifFalse: [ TypInfInlLookupContext
						sender: aMessage context
						state: aMessage state
						node: aMessage node
						self: aLookup self
						super: aLookup super
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
		typRemoveAt: {#context.
				aMethod methodClass.
				aMethod selector}.
	self flag: 'TODO invalidate senders etc. too'.
	"oldMethod sendsSelector: aLookup selector"
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
