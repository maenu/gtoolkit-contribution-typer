Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState class >> cache: anIdentityDictionary [
	^ self new
		initializeCache: anIdentityDictionary;
		yourself
]

{ #category : #accessing }
TypInfState >> = anObject [
	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject cache = cache ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypInfState >> associations [
	^ cache associations
]

{ #category : #accessing }
TypInfState >> at: aNode [
	^ cache at: aNode
]

{ #category : #accessing }
TypInfState >> at: aNode covariantPut: aType [
	^ cache
		at: aNode
		put: (cache
				at: aNode
				ifPresent: [ :t | t covariant: aType ]
				ifAbsent: [ aType ])
]

{ #category : #accessing }
TypInfState >> at: aNode ifAbsent: anotherBlock [
	^ cache at: aNode ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfState >> at: aNode ifPresent: aBlock [
	^ cache at: aNode ifPresent: aBlock
]

{ #category : #accessing }
TypInfState >> at: aNode ifPresent: aBlock ifAbsent: anotherBlock [
	^ cache
		at: aNode
		ifPresent: aBlock
		ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [
	self assert: [ aType isKindOf: TypType ].
	^ cache at: aNode put: aType
]

{ #category : #accessing }
TypInfState >> cache [
	^ cache
]

{ #category : #accessing }
TypInfState >> diff: aState [
	| diff |
	diff := cache species new.
	cache keys , aState keys
		do: [ :n | 
			| a b |
			a := cache at: n ifAbsent: [ nil ].
			b := aState at: n ifAbsent: [ nil ].
			a = b
				ifFalse: [ diff
						at: n
						put: {a.
								b} ] ].
	^ diff
]

{ #category : #accessing }
TypInfState >> hash [
	^ cache hash
]

{ #category : #accessing }
TypInfState >> initializeCache: anIdentityDictionary [
	cache := anIdentityDictionary
]

{ #category : #accessing }
TypInfState >> keys [
	^ cache keys
]

{ #category : #accessing }
TypInfState >> postCopy [
	cache := cache copy
]
