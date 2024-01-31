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
	variables := aBehavior allSlots asIdentitySet.
	aBehavior isClass
		ifTrue: [ variables addAll: aBehavior instanceSide allClassVariables ].
	variables
		ifNotEmpty: [ cache
				typAt: {#variables.
						aBehavior}
				put: variables ].
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
		typAt: {#variables.
				aMethod methodClass}
		ifPresent: [ :vs | 
			vs
				select: [ :v | v isWrittenIn: aMethod ]
				thenDo: [ :v | 
					cache
						typAt: {#writers.
								v}
						add: aMethod ] ].
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
	cache
		typAt: {#implementors.
				aMethod selector}
		add: aMethod methodClass.
	aMethod overriddenMethods
		do: [ :m | 
			cache
				typAt: {#overriders.
						m}
				add: aMethod ]
]

{ #category : #accessing }
TypInfIndex >> completenessAbsCanResolveOn: aStream [
	Smalltalk globals allMethods
		select: #typInfAbsIsCanResolve
		thenDo: [ :m | 
			m typInfAbsCanResolve
				do: [ :s | 
					cache
						typAt: {#absCanResolve.
								m methodClass.
								s}
						ifPresent: [ :mm | 
							mm == m
								ifFalse: [ aStream
										nextPut: {'found non-indexed absCanResolve method'.
												m methodClass.
												s.
												m} ] ]
						ifAbsent: [ aStream
								nextPut: {'found non-indexed absCanResolve method'.
										m methodClass.
										s.
										m} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessAbsResolveOn: aStream [
	Smalltalk globals allMethods
		select: #typInfAbsIsResolve
		thenDo: [ :m | 
			m typInfAbsResolve
				do: [ :s | 
					cache
						typAt: {#absResolve.
								m methodClass.
								s}
						ifPresent: [ :mm | 
							mm == m
								ifFalse: [ aStream
										nextPut: {'found non-indexed absResolve method'.
												m methodClass.
												s.
												m} ] ]
						ifAbsent: [ aStream
								nextPut: {'found non-indexed absResolve method'.
										m methodClass.
										s.
										m} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessImplementorsOn: aStream [
	Smalltalk globals allMethods
		do: [ :m | 
			cache
				typAt: {#implementors.
						m selector}
				ifPresent: [ :ms | 
					(ms includes: m methodClass)
						ifFalse: [ aStream
								nextPut: {'found non-indexed implementing method'.
										m} ] ]
				ifAbsent: [ aStream
						nextPut: {'found non-indexed implementing method'.
								m} ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessOn: aStream [
	self completenessVariablesOn: aStream.
	self completenessWritersOn: aStream.
	self completenessOverridersOn: aStream.
	self completenessImplementorsOn: aStream.
	self completenessAbsCanResolveOn: aStream.
	self completenessAbsResolveOn: aStream
]

{ #category : #accessing }
TypInfIndex >> completenessOverridersOn: aStream [
	Smalltalk globals allMethods
		do: [ :m | 
			m overriddenMethods
				do: [ :mm | 
					cache
						typAt: {#overriders.
								mm}
						ifPresent: [ :ms | 
							(ms includes: m)
								ifFalse: [ aStream
										nextPut: {'found non-indexed overriding method'.
												mm.
												m} ] ]
						ifAbsent: [ aStream
								nextPut: {'found non-indexed overriding method'.
										mm.
										m} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessVariablesOn: aStream [
	Smalltalk globals allBehaviors
		do: [ :b | 
			| vs |
			vs := cache
					typAt: {#variables.
							b}
					ifAbsent: [ #() ].
			b slots
				do: [ :v | 
					(vs includes: v)
						ifFalse: [ aStream
								nextPut: {'found non-indexed variable'.
										b.
										v} ] ].
			b isClass
				ifTrue: [ b classVariables
						do: [ :v | 
							(vs includes: v)
								ifFalse: [ aStream
										nextPut: {'found non-indexed variable'.
												b.
												v} ] ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessWritersOn: aStream [
	Smalltalk globals allBehaviors
		do: [ :b | 
			| vs |
			vs := b allSlots
					, (b isClass ifTrue: [ b instanceSide allClassVariables ] ifFalse: [ #() ]).
			b methods
				do: [ :m | 
					vs
						do: [ :v | 
							(v isWrittenIn: m)
								ifTrue: [ (cache at: #writers)
										at: v
										ifPresent: [ :ms | 
											(ms includes: m)
												ifFalse: [ aStream
														nextPut: {'found non-indexed writer'.
																v.
																m} ] ]
										ifAbsent: [ aStream
												nextPut: {'found non-indexed writer'.
														v.
														m} ] ] ] ] ]
]

{ #category : #accessing }
TypInfIndex >> correctnessAbsCanResolveOn: aStream [
	(cache at: #absCanResolve)
		keysAndValuesDo: [ :c :d | 
			d
				keysAndValuesDo: [ :s :m | 
					m typInfAbsIsCanResolve
						ifFalse: [ aStream
								nextPut: {'found is not can resolve method'.
										c.
										s.
										m} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> correctnessAbsResolveOn: aStream [
	(cache at: #absResolve)
		keysAndValuesDo: [ :c :d | 
			d
				keysAndValuesDo: [ :s :m | 
					m typInfAbsIsResolve
						ifFalse: [ aStream
								nextPut: {'found is not resolve method'.
										c.
										s.
										m} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> correctnessImplementorsOn: aStream [
	(cache at: #implementors)
		keysAndValuesDo: [ :s :cs | 
			cs
				do: [ :c | 
					(c includesSelector: s)
						ifFalse: [ aStream
								nextPut: {'found non-implementing method'.
										s.
										c} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> correctnessOn: aStream [
	self correctnessVariablesOn: aStream.
	self correctnessWritersOn: aStream.
	self correctnessOverridersOn: aStream.
	self correctnessImplementorsOn: aStream.
	self correctnessAbsCanResolveOn: aStream.
	self correctnessAbsResolveOn: aStream
]

{ #category : #accessing }
TypInfIndex >> correctnessOverridersOn: aStream [
	(cache at: #overriders)
		keysAndValuesDo: [ :m :ms | 
			ms
				do: [ :mm | 
					((mm methodClass inheritsFrom: m methodClass) and: [ mm selector = m selector ])
						ifFalse: [ aStream
								nextPut: {'found non-overriding method'.
										m.
										mm} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> correctnessVariablesOn: aStream [
	(cache at: #variables)
		keysAndValuesDo: [ :c :vs | 
			vs
				do: [ :v | 
					(c lookupVar: v name)
						ifNil: [ aStream
								nextPut: {'found missing var'.
										c.
										v} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> correctnessWritersOn: aStream [
	(cache at: #writers)
		keysAndValuesDo: [ :v :ms | 
			ms
				do: [ :m | 
					(v isWrittenIn: m)
						ifFalse: [ aStream
								nextPut: {'writer not written'.
										v.
										m} ] ] ]
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
	"order is important. cache makes assumptions that classes are processed in hierarchical order, e.g. overriders"

	super initialize.
	(Smalltalk globals allBehaviors sorted: [ :a :b | b inheritsFrom: a ])
		do: [ :b | self addBehavior: b ]
]

{ #category : #accessing }
TypInfIndex >> inlCanResolve: aLookup message: aMessage [
	| resolved lookups |
	TypInfNodeStack actives size
		< TypInfCurrentConfiguration value maxNodeStackSize ifFalse: [ ^ false ].
	aMessage context stackSize
		< (aMessage context home root iterations size + 3
				min: TypInfCurrentConfiguration value maxNodeStackSize) ifFalse: [ ^ false ].
	(aMessage couldBeSelfOrSuperSend or: [ aMessage hasNodes ])
		ifFalse: [ ^ false ].
	resolved := aLookup resolve.
	resolved compiledMethod ifNil: [ ^ false ].
	lookups := self inlLookups: aLookup.
	(lookups size between: 1 and: TypInfCurrentConfiguration value maxImplementors)
		ifFalse: [ ^ false ].
	lookups
		detect: [ :l | l compiledMethod size <= TypInfCurrentConfiguration value maxMethodSize ]
		ifNone: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypInfIndex >> inlLookups: aLookup [
	aLookup compiledMethod isAbstract ifFalse: [ ^ {aLookup} ].
	^ (aLookup self overriders: aLookup selector)
		flatCollect: [ :m | self inlLookups: (aLookup withReceiver: m methodClass typAsType) ]
		as: Set
]

{ #category : #accessing }
TypInfIndex >> inlResolve: aLookup message: aMessage [
	^ (self inlLookups: aLookup)
		collect: [ :l | 
			(l compiledMethod size <= TypInfCurrentConfiguration value maxMethodSize
				and: [ (l resolver isKindOf: TypInfMethodResolver) or: [ aMessage hasNodes ] ])
				ifTrue: [ TypInfInlContext
						sender: aMessage context
						state: aMessage state
						node: ([ l compiledMethod ast ]
								on: OCUndeclaredVariableWarning
								do: [ :e | e resume: e declareUndefined ])
						lookup: l
						message: aMessage ]
				ifFalse: [ TypInfInlLookupContext
						sender: aMessage context
						state: aMessage state
						node: aMessage node
						lookup: l
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
