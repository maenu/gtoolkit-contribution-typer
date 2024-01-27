Class {
	#name : #TypShaIndex,
	#superclass : #TypIndex,
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaIndex >> addMethod: aMethod [
	aMethod typShaIsResolveMethod
		ifTrue: [ cache
				typAt: {#method.
						aMethod methodClass.
						aMethod typShaResolvedMethodSelector}
				put: aMethod ].
	aMethod typShaIsResolveVariable
		ifTrue: [ cache
				typAt: {#variable.
						aMethod methodClass.
						aMethod typShaResolvedVariableSelector}
				put: aMethod ].
	aMethod typShaIsResolveType
		ifTrue: [ cache
				typAt: {#type.
						aMethod methodClass}
				put: aMethod ]
]

{ #category : #accessing }
TypShaIndex >> canResolveMethod: aLookup [
	^ cache
		typAt: {#method.
				aLookup receiver classDescription.
				aLookup selector}
		ifPresent: [ :m | true ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
TypShaIndex >> canResolveType: aLookup [
	^ cache
		typAt: {#type.
				aLookup classDescription class}
		ifPresent: [ :m | true ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
TypShaIndex >> canResolveVariable: aLookup [
	^ cache
		typAt: {#variable.
				aLookup receiver classDescription.
				aLookup selector}
		ifPresent: [ :m | true ]
		ifAbsent: [ false ]
]

{ #category : #accessing }
TypShaIndex >> completenessMethodOn: aStream [
	Smalltalk globals allBehaviors
		do: [ :b | 
			b methods
				select: #typShaIsResolveMethod
				thenDo: [ :m | 
					cache
						typAt: {#method.
								b.
								m typShaResolvedMethodSelector}
						ifAbsent: [ aStream
								nextPut: {'found non-indexed method'.
										b.
										m typShaResolvedMethodSelector} ] ] ]
]

{ #category : #accessing }
TypShaIndex >> completenessOn: aStream [
	self completenessTypeOn: aStream.
	self completenessVariableOn: aStream.
	self completenessMethodOn: aStream
]

{ #category : #accessing }
TypShaIndex >> completenessTypeOn: aStream [
	Smalltalk globals allBehaviors
		do: [ :b | 
			b methods
				select: #typShaIsResolveType
				thenDo: [ :m | 
					cache
						typAt: {#type.
								b}
						ifAbsent: [ aStream
								nextPut: {'found non-indexed type'.
										b.
										m} ] ] ]
]

{ #category : #accessing }
TypShaIndex >> completenessVariableOn: aStream [
	Smalltalk globals allBehaviors
		do: [ :b | 
			b methods
				select: #typShaIsResolveVariable
				thenDo: [ :m | 
					cache
						typAt: {#variable.
								b.
								m typShaResolvedVariableSelector}
						ifAbsent: [ aStream
								nextPut: {'found non-indexed variable'.
										b.
										m typShaResolvedVariableSelector} ] ] ]
]

{ #category : #accessing }
TypShaIndex >> correctnessMethodOn: aStream [
	(cache at: #method)
		keysAndValuesDo: [ :b :ms | 
			ms
				keysAndValuesDo: [ :s :m | 
					(m typShaIsResolveMethod
						and: [ m typShaResolvedMethodSelector = s and: [ m methodClass = b ] ])
						ifFalse: [ aStream
								nextPut: {'found non-method method'.
										b.
										m} ] ] ]
]

{ #category : #accessing }
TypShaIndex >> correctnessOn: aStream [
	self correctnessTypeOn: aStream.
	self correctnessVariableOn: aStream.
	self correctnessMethodOn: aStream
]

{ #category : #accessing }
TypShaIndex >> correctnessTypeOn: aStream [
	(cache at: #type)
		keysAndValuesDo: [ :b :m | 
			(m typShaIsResolveType and: [ m methodClass = b ])
				ifFalse: [ aStream
						nextPut: {'found non-type method'.
								b.
								m} ] ]
]

{ #category : #accessing }
TypShaIndex >> correctnessVariableOn: aStream [
	(cache at: #variable)
		keysAndValuesDo: [ :b :vs | 
			vs
				keysAndValuesDo: [ :s :m | 
					(m typShaIsResolveVariable
						and: [ m typShaResolvedVariableSelector = s and: [ m methodClass = b ] ])
						ifFalse: [ aStream
								nextPut: {'found non-variable method'.
										b.
										m} ] ] ]
]

{ #category : #accessing }
TypShaIndex >> initialize [
	super initialize.
	Smalltalk globals allMethods do: [ :m | self addMethod: m ]
]

{ #category : #accessing }
TypShaIndex >> removeBehavior: aBehavior [
	(cache at: #method) removeKey: aBehavior ifAbsent: [  "noop" ].
	(cache at: #variable) removeKey: aBehavior ifAbsent: [  "noop" ].
	(cache at: #type) removeKey: aBehavior ifAbsent: [  "noop" ]
]

{ #category : #accessing }
TypShaIndex >> removeMethod: aMethod [
	aMethod typShaIsResolveMethod
		ifTrue: [ (cache
				typAt: {#method.
						aMethod methodClass})
				removeKey: aMethod typShaResolvedMethodSelector
				ifAbsent: [  "noop" ] ].
	aMethod typShaIsResolveVariable
		ifTrue: [ (cache
				typAt: {#variable.
						aMethod methodClass})
				removeKey: aMethod typShaResolvedVariableSelector
				ifAbsent: [  "noop" ] ].
	aMethod typShaIsResolveType
		ifTrue: [ (cache typAt: {#type}) removeKey: aMethod methodClass ifAbsent: [  "noop" ] ]
]

{ #category : #accessing }
TypShaIndex >> resultMethod: aLookup root: anotherLookup [
	| method |
	method := cache
			typAt: {#method.
					aLookup receiver classDescription.
					aLookup selector}.
	^ nil
		withArgs: {aLookup.
				anotherLookup}
		executeMethod: method
]

{ #category : #accessing }
TypShaIndex >> resultType: aLookup root: anotherLookup [
	| method |
	method := cache
			typAt: {#type.
					aLookup classDescription class}.
	^ nil
		withArgs: {aLookup.
				anotherLookup}
		executeMethod: method
]

{ #category : #accessing }
TypShaIndex >> resultVariable: aLookup root: anotherLookup [
	| method |
	method := cache
			typAt: {#variable.
					aLookup receiver classDescription.
					aLookup selector}.
	^ nil
		withArgs: {aLookup.
				anotherLookup}
		executeMethod: method
]
