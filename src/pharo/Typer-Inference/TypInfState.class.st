Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'cache',
		'read'
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
	^ self
		at: aNode
		ifPresent: #yourself
		ifAbsent: [ cache errorKeyNotFound: aNode ]
]

{ #category : #accessing }
TypInfState >> at: aNode covariantPut: aType [
	^ self
		at: aNode
		put: (self
				at: aNode
				ifPresent: [ :t | t covariant: aType ]
				ifAbsent: [ aType ])
]

{ #category : #accessing }
TypInfState >> at: aNode ifAbsent: anotherBlock [
	^ self
		at: aNode
		ifPresent: #yourself
		ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfState >> at: aNode ifPresent: aBlock [
	^ self
		at: aNode
		ifPresent: aBlock
		ifAbsent: [ cache errorKeyNotFound: aNode ]
]

{ #category : #accessing }
TypInfState >> at: aNode ifPresent: aBlock ifAbsent: anotherBlock [
	read add: aNode.
	^ cache
		at: aNode
		ifPresent: aBlock
		ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [
	self assert: [ aType isKindOf: TypType ].
	read add: aNode.
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
	cache keys , aState cache keys "indirect access to not record reads"
		do: [ :n | 
			| a b |
			a := cache at: n ifAbsent: [ nil ].
			b := aState cache at: n ifAbsent: [ nil ].
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
	cache := anIdentityDictionary.
	read := IdentitySet new
]

{ #category : #accessing }
TypInfState >> keys [
	^ cache keys
]

{ #category : #accessing }
TypInfState >> postCopy [
	self initializeCache: cache copy
]

{ #category : #accessing }
TypInfState >> read [
	^ read
]

{ #category : #accessing }
TypInfState >> reduceToReadIn: aNode [
	cache := (read , {aNode} select: [ :n | cache includesKey: n ])
			collect: [ :n | n -> (cache at: n) ]
			as: IdentityDictionary
]

{ #category : #accessing }
TypInfState >> resetRead [
	read removeAll
]

{ #category : #accessing }
TypInfState >> slurp: aState [
	aState associations do: [ :a | self at: a key covariantPut: a value ]
]
