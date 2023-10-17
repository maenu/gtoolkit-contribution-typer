Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'state',
		'cache'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState class >> cache: anOrderedIdentityDictionary [
	^ self new
		initializeCache: anOrderedIdentityDictionary;
		yourself
]

{ #category : #accessing }
TypInfState class >> state: aState [
	^ self new
		initializeState: aState;
		yourself
]

{ #category : #accessing }
TypInfState >> = anObject [
	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	(anObject state = state and: [ anObject cache = cache ]) ifTrue: [ ^ true ].
	^ self associations = anObject associations
]

{ #category : #accessing }
TypInfState >> associations [
	| keys |
	keys := cache keys.
	^ (state
		ifNil: #()
		ifNotNil: [ state associations reject: [ :a | keys includes: a key ] ])
		, cache associations
]

{ #category : #accessing }
TypInfState >> at: aNode [
	^ self
		at: aNode
		ifPresent: #yourself
		ifAbsent: nil
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

{ #category : #'as yet unclassified' }
TypInfState >> at: aNode ifPresent: aBlock [
	^ self
		at: aNode
		ifPresent: aBlock
		ifAbsent: nil
]

{ #category : #accessing }
TypInfState >> at: aNode ifPresent: aBlock ifAbsent: anotherBlock [
	self
		flag: 'TODO drag up read into cache, to later throw away original state to save memory'.
	cache at: aNode ifPresent: [ :t | ^ aBlock value: t ].
	state ifNotNil: [ state at: aNode ifPresent: [ :t | ^ aBlock value: t ] ].
	^ anotherBlock value
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
TypInfState >> copy [
	^ state
		ifNil: [ TypInfState state: self ]
		ifNotNil: [ TypInfState cache: (self associations as: OrderedIdentityDictionary) ]
]

{ #category : #accessing }
TypInfState >> diff: aState [
	| diff |
	diff := cache species new.
	self keys , aState keys
		do: [ :n | 
			| a b |
			a := self at: n ifAbsent: [ nil ].
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
	^ self associations hash
]

{ #category : #accessing }
TypInfState >> initialize [
	super initialize.
	self initializeCache: OrderedIdentityDictionary new
]

{ #category : #accessing }
TypInfState >> initializeCache: anOrderedIdentityDictionary [
	cache := anOrderedIdentityDictionary
]

{ #category : #accessing }
TypInfState >> initializeState: aState [
	state := aState
]

{ #category : #accessing }
TypInfState >> keys [
	^ (state ifNil: #() ifNotNil: [ state keys ]) , cache keys as: IdentitySet
]

{ #category : #accessing }
TypInfState >> lazyCopy [
	^ state
		ifNotNil: [ TypInfState cache: (self associations as: OrderedIdentityDictionary) ]
		ifNil: [ TypInfState state: self ]
]

{ #category : #accessing }
TypInfState >> state [
	^ state
]
