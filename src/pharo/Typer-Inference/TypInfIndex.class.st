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
TypInfIndex >> context: aMethod [
	^ self context: aMethod by: #run
]

{ #category : #accessing }
TypInfIndex >> context: aMethod by: aBlock [
	| node lookup path |
	node := aMethod ast.
	lookup := aMethod typInfAsLookup.
	path := lookup typInfAsContextPath.
	cache
		typAt: path
		ifPresent: [ :c | 
			c nodeStackDepth <= TypInfNodeStack actives size
				ifTrue: [ ^ c ]
				ifFalse: [ cache typRemoveAt: path ] ].
	^ TypInfNodeStack
		push: node
		during: [ [ aBlock
				value: (cache
						typAt: path
						put: (TypInfContext
								sender: nil
								state: TypInfState new
								node: node
								self: lookup self
								super: lookup super)) ] ifCurtailed: [ cache typRemoveAt: path ] ]
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
TypInfIndex >> contextAsync: aMethod by: aBlock for: aDuration [
	| start |
	start := DateAndTime now.
	^ ([ self context: aMethod by: aBlock ] typInfValueAsyncFor: aDuration)
		then: [ :c | 
			{DateAndTime now - start.
				c} ]
		otherwise: [ :e | 
			{DateAndTime now - start.
				e} ]
]

{ #category : #accessing }
TypInfIndex >> contextAsyncWithTally: aMethod by: aBlock for: aDuration [
	| start tally |
	start := DateAndTime now.
	tally := MessageTally new.
	^ ([ | context |
	tally spyEvery: 1 on: [ context := self context: aMethod by: aBlock ].
	context ] typInfValueAsyncFor: aDuration)
		then: [ :c | 
			{DateAndTime now - start c.
				tally} ]
		otherwise: [ :e | 
			{DateAndTime now - start.
				e.
				tally} ]
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
				aMethod selector.
				self}.
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
TypInfIndex >> updateContext: aMethod [
	^ self updateContext: aMethod by: #run
]

{ #category : #accessing }
TypInfIndex >> updateContext: aMethod by: aBlock [
	cache typRemoveAt: aMethod typInfAsLookup typInfAsContextPath.
	^ self context: aMethod by: aBlock
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
