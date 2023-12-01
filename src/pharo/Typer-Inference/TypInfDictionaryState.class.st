Class {
	#name : #TypInfDictionaryState,
	#superclass : #Object,
	#instVars : [
		'cache'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfDictionaryState >> associationsDo: aBlock [
	cache associationsDo: [ :a | aBlock value: a value ]
]

{ #category : #accessing }
TypInfDictionaryState >> at: aNode [
	^ self at: aNode ifAbsent: [ cache errorKeyNotFound: aNode ]
]

{ #category : #accessing }
TypInfDictionaryState >> at: aNode covariantPut: aType [
	cache
		at: aNode
		ifPresent: [ :a | 
			^ a
				at: 3
				put: ((a at: 3) ifNil: [ aType ] ifNotNil: [ :t | t covariant: aType ]) ]
		ifAbsentPut: [ {aNode.
				nil.
				aType} ].
	^ aType
]

{ #category : #accessing }
TypInfDictionaryState >> at: aNode ifAbsent: anotherBlock [
	^ self
		at: aNode
		ifPresent: #yourself
		ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfDictionaryState >> at: aNode ifPresent: aBlock [
	^ self
		at: aNode
		ifPresent: aBlock
		ifAbsent: nil
]

{ #category : #accessing }
TypInfDictionaryState >> at: aNode ifPresent: aBlock ifAbsent: anotherBlock [
	^ cache
		at: aNode
		ifPresent: [ :a | ^ (a at: 3) ifNil: anotherBlock ifNotNil: [ :t | aBlock value: t ] ]
		ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfDictionaryState >> at: aNode put: aType [
	self assert: [ aType isKindOf: TypType ].
	cache
		at: aNode
		ifPresent: [ :a | ^ a at: 3 put: aType ]
		ifAbsentPut: [ {aNode.
				nil.
				aType} ].
	^ aType
]

{ #category : #accessing }
TypInfDictionaryState >> changes [
	| result |
	result := IdentityDictionary new: cache size.
	self
		associationsDo: [ :a | 
			| t |
			t := a at: 3.
			(a at: 2) == t ifFalse: [ result at: (a at: 1) put: t ].
			a at: 2 put: t ].
	^ result
]

{ #category : #accessing }
TypInfDictionaryState >> initialize [
	super initialize.
	cache := IdentityDictionary new: 1000	"avoids grow for most graphs"
]

{ #category : #accessing }
TypInfDictionaryState >> postCopy [
	| newCache |
	super postCopy.
	newCache := cache species new: cache capacity.
	self associationsDo: [ :a | newCache at: (a at: 1) put: a copy ].
	cache := newCache
]

{ #category : #accessing }
TypInfDictionaryState >> slurpAll: aCollection [
	| size |
	size := aCollection size.
	self associationsDo: [ :a | a at: 3 put: (Array new: size) ].
	aCollection
		withIndexDo: [ :s :i | 
			s
				associationsDo: [ :aOther | 
					| n |
					n := aOther at: 1.
					(aOther at: 3)
						ifNil: [ cache
								at: n
								ifAbsentPut: [ {n.
										nil.
										Array new: size} ] ]
						ifNotNil: [ :t | 
							cache
								at: n
								ifPresent: [ :aSelf | (aSelf at: 3) at: i put: t ]
								ifAbsentPut: [ {n.
										nil.
										(Array new: size)
											at: i put: t;
											yourself} ] ] ] ].
	self
		associationsDo: [ :a | 
			| s |
			s := a at: 3.
			a
				at: 3
				put: (s size = 0
						ifTrue: [ nil ]
						ifFalse: [ | current |
							s
								do: [ :t | 
									t
										ifNotNil: [ current := current ifNil: [ t ] ifNotNil: [ current covariant: t ] ] ].
							current ]) ]
]
