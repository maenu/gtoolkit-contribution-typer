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
		typAt: {#indexed.
				aMethod}
		ifPresent: [ ^ self ]
		ifAbsentPut: [ true ].
	cache
		typAt: {#variables.
				aMethod methodClass}
		ifPresent: [ :vs | 
			vs
				select: [ :v | v isWrittenIn: aMethod ]
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
TypInfIndex >> asdf [
]

{ #category : #accessing }
TypInfIndex >> completeness [
	^ OrderedCollection streamContents: [ :s | self completenessOn: s ]
]

{ #category : #accessing }
TypInfIndex >> completenessAbsCanResolveOn: aStream [
	Smalltalk
		allClassesAndTraitsDo: [ :c | 
			c
				methodsDo: [ :m | 
					m typInfAbsIsCanResolve
						ifTrue: [ m typInfAbsCanResolve
								do: [ :s | 
									cache
										typAt: {#absCanResolve.
												m methodClass.
												s}
										ifPresent: [ :mm | 
											mm == m
												ifFalse: [ aStream
														nextPut: {'found non-indexed absCanResolve method'.
																c.
																s.
																m} ] ]
										ifAbsent: [ aStream
												nextPut: {'found non-indexed absCanResolve method'.
														c.
														s.
														m} ] ] ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessAbsResolveOn: aStream [
	Smalltalk
		allClassesAndTraitsDo: [ :c | 
			c
				methodsDo: [ :m | 
					m typInfAbsIsResolve
						ifTrue: [ m typInfAbsResolve
								do: [ :s | 
									cache
										typAt: {#absResolve.
												m methodClass.
												s}
										ifPresent: [ :mm | 
											mm == m
												ifFalse: [ aStream
														nextPut: {'found non-indexed absResolve method'.
																c.
																s.
																m} ] ]
										ifAbsent: [ aStream
												nextPut: {'found non-indexed absResolve method'.
														c.
														s.
														m} ] ] ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessImplementorsOn: aStream [
	Smalltalk
		allClassesAndTraitsDo: [ :c | 
			c
				methodsDo: [ :m | 
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
										m} ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessIndexedOn: aStream [
	Smalltalk
		allClassesDo: [ :c | 
			((cache at: #indexed) includesKey: c)
				ifFalse: [ aStream
						nextPut: {'found non-indexed class'.
								c} ].
			((cache at: #indexed) includesKey: c class)
				ifFalse: [ aStream
						nextPut: {'found non-indexed class'.
								c class} ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessOn: aStream [
	self completenessIndexedOn: aStream.
	self completenessVariablesOn: aStream.
	self completenessWritersOn: aStream.
	self completenessOverridersOn: aStream.
	self completenessImplementorsOn: aStream.
	self completenessAbsCanResolveOn: aStream.
	self completenessAbsResolveOn: aStream
]

{ #category : #accessing }
TypInfIndex >> completenessOverridersOn: aStream [
	Smalltalk
		allClassesAndTraitsDo: [ :c | 
			c
				methodsDo: [ :m | 
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
												m} ] ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessVariablesOn: aStream [
	Smalltalk
		allClassesAndTraitsDo: [ :c | 
			| vs |
			vs := cache
					typAt: {#variables.
							c}
					ifAbsent: [ #() ].
			c instanceVariables
				do: [ :v | 
					(vs includes: v)
						ifFalse: [ aStream
								nextPut: {'found non-indexed variable'.
										c.
										v} ] ].
			c isClass
				ifTrue: [ c classVariables
						do: [ :v | 
							(vs includes: v)
								ifFalse: [ aStream
										nextPut: {'found non-indexed variable'.
												c.
												v} ] ] ] ]
]

{ #category : #accessing }
TypInfIndex >> completenessWritersOn: aStream [
	Smalltalk
		allClassesAndTraitsDo: [ :c | 
			| vs |
			vs := c allSlots
					, (c isClass ifTrue: [ c instanceSide allClassVariables ] ifFalse: [ #() ]).
			c methods
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
TypInfIndex >> correcteness [
	^ OrderedCollection streamContents: [ :s | self correctnessOn: s ]
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
TypInfIndex >> correctnessIndexedOn: aStream [
	(cache at: #indexed)
		keysAndValuesDo: [ :c :b | 
			(c isClass and: [ c isObsolete ])
				ifTrue: [ aStream
						nextPut: {'found obsolete class'.
								c} ].
			(c isCompiledMethod and: [ c isInstalled not ])
				ifTrue: [ aStream
						nextPut: {'found obsolete method'.
								c} ] ]
]

{ #category : #accessing }
TypInfIndex >> correctnessOn: aStream [
	self correctnessIndexedOn: aStream.
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
	super initialize.
	(Smalltalk allClassesAndTraits sorted: [ :a :b | b inheritsFrom: a ])
		do: [ :b | 
			self addBehavior: b.
			self addBehavior: b class ]
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
