Class {
	#name : #TypInfIndex,
	#superclass : #TypIndex,
	#instVars : [
		'maxIterations',
		'maxNodeStackSize',
		'maxImplementors',
		'maxWriters',
		'maxMethodSize'
	],
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfIndex >> absCanResolve: aLookup [
	^ cache
		typAt: {#absCanResolve.
				aLookup receiver classDescription.
				aLookup selector}
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfIndex >> absResolve: aLookup [
	^ cache
		typAt: {#absResolve.
				aLookup receiver classDescription.
				aLookup selector}
		ifAbsent: [ #() ]
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
TypInfIndex >> asyncContextAt: aLookup ifNew: aBlock for: aDuration [
	| start context |
	start := DateAndTime now.
	^ ([ self
		contextAt: aLookup
		ifNew: [ :c | 
			context := c.
			aBlock value: c ] ] asAsyncFuture typAwaitFor: aDuration)
		then: [ :c | 
			{DateAndTime now - start.
				c} ]
		otherwise: [ :e | 
			{DateAndTime now - start.
				context.
				e freeze} ]
]

{ #category : #accessing }
TypInfIndex >> asyncUpdateContextAt: aLookup ifNew: aBlock for: aDuration [
	cache typRemoveAt: aLookup typInfAsContextPath.
	^ self
		asyncContextAt: aLookup
		ifNew: aBlock
		for: aDuration
]

{ #category : #accessing }
TypInfIndex >> asyncWithTallyContextAt: aLookup ifNew: aBlock for: aDuration [
	| start context tally |
	start := DateAndTime now.
	tally := MessageTally new.
	^ ([ tally
		spyEvery: 1
		on: [ self
				contextAt: aLookup
				ifNew: [ :c | 
					context := c.
					aBlock value: c ] ].
	context ] asAsyncFuture typAwaitFor: aDuration)
		then: [ :c | 
			{DateAndTime now - start.
				c.
				tally} ]
		otherwise: [ :e | 
			{DateAndTime now - start.
				context.
				e freeze.
				tally} ]
]

{ #category : #accessing }
TypInfIndex >> asyncWithTallyUpdateContextAt: aLookup ifNew: aBlock for: aDuration [
	cache typRemoveAt: aLookup typInfAsContextPath.
	^ self
		asyncWithTallyContextAt: aLookup
		ifNew: aBlock
		for: aDuration
]

{ #category : #accessing }
TypInfIndex >> canResolve: aLookup [
	(aLookup resolver isKindOf: TypInfMethodResolver) ifFalse: [ ^ false ].
	^ resolver canResolve: aLookup
]

{ #category : #accessing }
TypInfIndex >> contextAt: aLookup [
	^ self contextAt: aLookup ifNew: #run
]

{ #category : #accessing }
TypInfIndex >> contextAt: aLookup ifNew: aBlock [
	^ self
		contextAt: aLookup
		ifNew: aBlock
		ifPresent: #yourself
		ifAbsent: [ self error: 'node stack reached max size' ]
]

{ #category : #accessing }
TypInfIndex >> contextAt: aLookup ifNew: aBlock ifPresent: anotherBlock ifAbsent: yetAnotherBlock [
	| node path |
	node := aLookup compiledMethod ast.
	path := aLookup typInfAsContextPath.
	cache
		typAt: path
		ifPresent: [ :c | 
			TypInfNodeStack actives size + 1 < c nodeStackDepth
				ifTrue: [ cache typRemoveAt: path ]
				ifFalse: [ ^ anotherBlock value: c ] ].
	^ TypInfNodeStack
		push: node
		during: [ [ | context |
			context := TypInfContext
					sender: nil
					state: nil
					node: node
					self: aLookup root self
					super: aLookup root super.
			cache typAt: path put: context.
			aBlock value: context.
			anotherBlock value: context ] ifCurtailed: [ cache typRemoveAt: path ] ]
		or: [ yetAnotherBlock value ]
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
	resolver := TypDepthFirstResolver
			resolver: (TypBreadthFirstResolver
					resolvers: {TypInfAbsMethodResolver new.
							TypInfInlMethodResolver new}).
	{ProtoObject} , ProtoObject allSubclasses , {ProtoObject class}
		, ProtoObject class allSubclasses do: [ :b | self addBehavior: b ].
	maxIterations := 16.
	maxNodeStackSize := 6.
	maxImplementors := self implementors95Quantile.
	maxWriters := self writers95Quantile.
	maxMethodSize := self methodSize95Quantile
]

{ #category : #accessing }
TypInfIndex >> invalidateOnClassChange: aClassAnnouncement [
	aClassAnnouncement typInfInvalidateIndex
]

{ #category : #accessing }
TypInfIndex >> invalidateOnMethodChange: aMethodAnnouncement [
	aMethodAnnouncement typInfInvalidateIndex
]

{ #category : #accessing }
TypInfIndex >> maxImplementors [
	^ maxImplementors
]

{ #category : #accessing }
TypInfIndex >> maxIterations [
	^ maxIterations
]

{ #category : #accessing }
TypInfIndex >> maxMethodSize [
	^ maxMethodSize
]

{ #category : #accessing }
TypInfIndex >> maxNodeStackSize [
	^ maxNodeStackSize
]

{ #category : #accessing }
TypInfIndex >> maxWriters [
	^ maxWriters
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
TypInfIndex >> resolve: aLookup [
	^ resolver resolve: aLookup
]

{ #category : #accessing }
TypInfIndex >> updateContextAt: aLookup [
	^ self updateContextAt: aLookup ifNew: #run
]

{ #category : #accessing }
TypInfIndex >> updateContextAt: aLookup ifNew: aBlock [
	cache typRemoveAt: aLookup typInfAsContextPath.
	^ self contextAt: aLookup ifNew: aBlock
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
