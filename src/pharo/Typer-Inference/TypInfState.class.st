Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'cache',
		'read',
		'updated',
		'created',
		'node'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState class >> node: aNode [
	^ self new
		initializeNode: aNode;
		yourself
]

{ #category : #accessing }
TypInfState >> = anObject [
	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject size = self size ifFalse: [ ^ false ].
	created
		associationsDo: [ :a | (anObject at: a key ifAbsent: [ ^ false ]) = a value ifFalse: [ ^ false ] ].
	updated
		associationsDo: [ :a | (anObject at: a key ifAbsent: [ ^ false ]) = a value ifFalse: [ ^ false ] ].
	cache == anObject cache ifTrue: [ ^ true ].
	cache
		associationsDo: [ :a | 
			updated
				at: a key
				ifAbsent: [ (anObject at: a key ifAbsent: [ ^ false ]) = a value ifFalse: [ ^ false ] ] ].
	^ true
]

{ #category : #accessing }
TypInfState >> associations [
	^ Array
		new: self size
		streamContents: [ :s | self associationsDo: [ :a | s nextPut: a ] ]
]

{ #category : #accessing }
TypInfState >> associationsDo: aBlock [
	cache
		associationsDo: [ :a | (updated includesKey: a key) ifFalse: [ aBlock value: a ] ].
	updated associationsDo: aBlock.
	created associationsDo: aBlock
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
		ifAbsent: [ nil ]
]

{ #category : #accessing }
TypInfState >> at: aNode ifPresent: aBlock ifAbsent: anotherBlock [
	read add: aNode.
	created at: aNode ifPresent: [ :t | ^ aBlock value: t ].
	updated at: aNode ifPresent: [ :t | ^ aBlock value: t ].
	^ cache
		at: aNode
		ifPresent: aBlock
		ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [
	self assert: [ aType isKindOf: TypType ].
	^ cache
		at: aNode
		ifPresent: [ :t | updated at: aNode put: aType ]
		ifAbsent: [ created at: aNode put: aType ]
]

{ #category : #accessing }
TypInfState >> cache [
	^ cache
]

{ #category : #accessing }
TypInfState >> created [
	^ created
]

{ #category : #accessing }
TypInfState >> diff: aState [
	| diff oldRead |
	diff := cache species new: (self size max: aState size).
	oldRead := read copy.
	(self keys , aState keys) asIdentitySet
		do: [ :n | 
			| a b |
			a := self at: n ifAbsent: [ nil ].
			b := aState at: n ifAbsent: [ nil ].
			a = b
				ifFalse: [ diff
						at: n
						put: {a.
								b} ] ].
	read := oldRead.
	^ diff
]

{ #category : #accessing }
TypInfState >> hash [
	^ cache species hash bitXor: self size hash
]

{ #category : #accessing }
TypInfState >> includesKey: aNode [
	(created includesKey: aNode) ifTrue: [ ^ true ].
	(updated includesKey: aNode) ifTrue: [ ^ true ].
	^ cache includesKey: aNode
]

{ #category : #accessing }
TypInfState >> initialize [
	cache := IdentityDictionary new: 10.
	updated := IdentityDictionary new: 10.
	created := IdentityDictionary new: 10.
	read := LinkedList new
]

{ #category : #accessing }
TypInfState >> initializeNode: aNode [
	self assert: [ node isNil ].
	node := aNode
]

{ #category : #accessing }
TypInfState >> keys [
	^ Array
		new: self size
		streamContents: [ :s | self keysDo: [ :n | s nextPut: n ] ]
]

{ #category : #accessing }
TypInfState >> keysDo: aBlock [
	cache keysDo: [ :n | (updated includesKey: n) ifFalse: [ aBlock value: n ] ].
	updated keysDo: aBlock.
	created keysDo: aBlock
]

{ #category : #accessing }
TypInfState >> postCopy [
	super postCopy.
	node := nil.
	updated size + created size > cache size
		ifTrue: [ cache := cache copy
					addAll: updated;
					addAll: created;
					yourself.
			updated := IdentityDictionary new: updated size.
			created := IdentityDictionary new: created size ]
		ifFalse: [ updated := updated copy.
			created := created copy ].
	read := LinkedList new
]

{ #category : #'as yet unclassified' }
TypInfState >> read [
	^ read
]

{ #category : #accessing }
TypInfState >> reduceToRead [
	cache := (read asIdentitySet , {node} select: [ :n | self includesKey: n ])
			collect: [ :n | n -> (self at: n) ]
			as: IdentityDictionary.
	updated removeAll.
	created removeAll.
	read removeAll
]

{ #category : #accessing }
TypInfState >> size [
	^ cache size + created size
]

{ #category : #accessing }
TypInfState >> slurpAll: aCollection [
	aCollection ifEmpty: [ ^ self ].
	cache := cache copy
			addAll: updated;
			addAll: created;
			yourself.
	updated removeAll.
	created removeAll.
	aCollection
		do: [ :s | 
			s
				associationsDo: [ :a | 
					cache
						at: a key
						put: (cache
								at: a key
								ifPresent: [ :t | t covariant: a value ]
								ifAbsent: [ a value ]) ] ]
]

{ #category : #accessing }
TypInfState >> updated [
	^ updated
]

{ #category : #accessing }
TypInfState >> withNode: aNode [
	^ self copy
		initializeNode: aNode;
		yourself
]
