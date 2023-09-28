Class {
	#name : #TypInfIndex,
	#superclass : #TypIndex,
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
	variables := aBehavior instanceVariables asIdentitySet.
	aBehavior isClass ifTrue: [ variables addAll: aBehavior classVariables ].
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
	cache
		typAt: {#variables.
				aBehavior}
		put: variables.
	aBehavior methods do: [ :m | self addMethod: aBehavior ]
]

{ #category : #accessing }
TypInfIndex >> addMethod: aMethod [
	| c |
	(cache
		typAt: {#variables.
				aMethod methodClass})
		select: [ :v | v typInfIsWrittenIn: aMethod ]
		thenDo: [ :v | 
			(cache
				typAt: {#writers.
						v}) add: aMethod ].
	aMethod typInfAbsIsCanResolve
		ifTrue: [ (cache
				typAt: {#absCanResolve.
						aMethod methodClass.
						aMethod typInfAbsCanResolve}
				ifAbsentPut: [ IdentitySet new ]) add: aMethod ].
	aMethod typInfAbsIsResolve
		ifTrue: [ (cache
				typAt: {#absResolve.
						aMethod methodClass.
						aMethod typInfAbsResolve}
				ifAbsentPut: [ IdentitySet new ]) add: aMethod ].
	(cache
		typAt: {#implementors.
				aMethod selector}
		ifAbsentPut: [ IdentitySet new ]) add: aMethod methodClass.
	c := aMethod methodClass superclass.
	[ c isNil ]
		whileFalse: [ (c lookupSelector: aMethod selector)
				ifNotNil: [ :m | 
					(cache
						typAt: {#overriders.
								m}
						ifAbsentPut: [ IdentitySet new ]) add: aMethod.
					c := m methodClass superclass ] ]
]

{ #category : #accessing }
TypInfIndex >> context: aLookup [
	^ self context: aLookup by: #run
]

{ #category : #accessing }
TypInfIndex >> context: aLookup by: aBlock [
	| node |
	node := (aLookup receiver classDescription lookupSelector: aLookup selector)
			ast.
	cache
		typAt: aLookup typInfAsContextPath
		ifPresent: [ :c | 
			c nodeStackDepth <= TypInfNodeStack actives size
				ifTrue: [ ^ c ]
				ifFalse: [ cache typRemoveAt: aLookup typInfAsContextPath ] ].
	^ TypInfNodeStack
		push: node
		during: [ [ aBlock
				value: (cache
						typAt: aLookup typInfAsContextPath
						put: (TypInfContext
								sender: nil
								state: TypInfState new
								node: node
								self: aLookup self
								super: aLookup super)) ]
				ifCurtailed: [ cache typRemoveAt: aLookup typInfAsContextPath ] ]
		or: [ self error: 'node stack reached max size' ]
]

{ #category : #accessing }
TypInfIndex >> context: aLookup ifPresent: aBlock ifAbsent: anotherBlock [
	^ cache
		typAt: aLookup typInfAsContextPath
		ifPresent: aBlock
		ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfIndex >> contextAsync: aLookup by: aBlock for: aDuration [
	| start |
	start := DateAndTime now.
	^ ([ self context: aLookup by: aBlock ] typInfValueAsyncFor: aDuration)
		then: [ :c | 
			TypInfMethodMeasurement
				duration: DateAndTime now - start
				context: c
				error: nil
				tally: nil ]
		otherwise: [ :e | 
			TypInfMethodMeasurement
				duration: DateAndTime now - start
				context: nil
				error: e
				tally: nil ]
]

{ #category : #accessing }
TypInfIndex >> contextAsyncWithTally: aLookup by: aBlock for: aDuration [
	| start tally |
	start := DateAndTime now.
	tally := MessageTally new.
	^ ([ | context |
	tally spyEvery: 1 on: [ context := self context: aLookup by: aBlock ].
	context ] typInfValueAsyncFor: aDuration)
		then: [ :c | 
			TypInfMethodMeasurement
				duration: DateAndTime now - start
				context: c
				error: nil
				tally: tally ]
		otherwise: [ :e | 
			TypInfMethodMeasurement
				duration: DateAndTime now - start
				context: nil
				error: e
				tally: tally ]
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
	| behaviors |
	super initialize.
	resolver := TypDepthFirstResolver
			resolver: (TypBreadthFirstResolver
					resolvers: {TypInfAbsMethodResolver new.
							TypInfInlMethodResolver new}).
	behaviors := ProtoObject withAllSubclasses asOrderedCollection.	"toposort superclasses before subclasses so #allSuperclasses are initialized"
	behaviors addFirst: behaviors removeLast.	"ProtoObject is last for some reason"
	behaviors addAll: ProtoObject class withAllSubclasses.
	behaviors do: [ :b | self addBehavior: b ]
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
	aBehavior methods do: [ :m | self removeMethod: aBehavior ]
]

{ #category : #accessing }
TypInfIndex >> removeMethod: aMethod [
	| c |
	aMethod typInfAbsIsCanResolve
		ifTrue: [ cache
				typAt: {#absCanResolve.
						aMethod methodClass.
						aMethod typInfAbsCanResolve}
				ifPresent: [ :s | s remove: aMethod ] ].
	aMethod typInfAbsIsResolve
		ifTrue: [ cache
				typAt: {#absResolve.
						aMethod methodClass.
						aMethod typInfAbsCanResolve}
				ifPresent: [ :s | s remove: aMethod ] ].
	cache typRemoveAt: aMethod typInfAsLookup typInfAsContextPath.
	self flag: 'TODO invalidate senders etc. too'.
	cache
		typAt: {#implementors.
				aMethod selector}
		ifPresent: [ :s | s remove: aMethod methodClass ].
	c := aMethod methodClass superclass.
	[ c isNil ]
		whileFalse: [ (c lookupSelector: aMethod selector)
				ifNotNil: [ :m | 
					cache
						typAt: {#overriders.
								m}
						ifPresent: [ :s | s remove: aMethod ].
					c := m methodClass superclass ] ]
]

{ #category : #accessing }
TypInfIndex >> resolve: aLookup [
	^ resolver resolve: aLookup
]

{ #category : #accessing }
TypInfIndex >> updateContext: aLookup [
	^ self updateContext: aLookup by: #run
]

{ #category : #accessing }
TypInfIndex >> updateContext: aLookup by: aBlock [
	cache typRemoveAt: aLookup typInfAsContextPath.
	^ self context: aLookup by: aBlock
]

{ #category : #accessing }
TypInfIndex >> updateContextAsync: aLookup by: aBlock for: aDuration [
	cache typRemoveAt: aLookup typInfAsContextPath.
	^ self
		contextAsync: aLookup typInfAsContextPath
		by: aBlock
		for: aDuration
]

{ #category : #accessing }
TypInfIndex >> updateContextAsyncWithTally: aLookup by: aBlock for: aDuration [
	cache typRemoveAt: aLookup typInfAsContextPath.
	^ self
		contextAsyncWithTally: aLookup typInfAsContextPath
		by: aBlock
		for: aDuration
]

{ #category : #generated }
TypInfIndex >> writers: aVariable [
	^ cache
		at: #writers
		at: aVariable
		ifAbsent: [ #() ]
]
