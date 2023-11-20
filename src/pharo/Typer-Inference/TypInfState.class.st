Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'cache',
		'iteration'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState >> at: aNode [
	^ self
		at: aNode
		ifPresent: #yourself
		ifAbsent: [ cache errorKeyNotFound: aNode ]
]

{ #category : #accessing }
TypInfState >> at: aNode covariantPut: aType [
	| a |
	a := cache
			at: aNode
			ifAbsentPut: [ Array new: TypInfCurrentConfiguration value maxIterations + 1 ].
	^ a
		at: iteration
		put: ((a at: iteration) ifNil: [ aType ] ifNotNil: [ :t | t covariant: aType ])
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
	^ cache
		at: aNode
		ifPresent: [ :a | (a at: iteration) ifNil: anotherBlock ifNotNil: aBlock ]
		ifAbsent: anotherBlock
]

{ #category : #accessing }
TypInfState >> at: anInteger keysAndValuesDo: aBlock [
	^ cache
		keysAndValuesDo: [ :n :a | (a at: anInteger) ifNotNil: [ :t | aBlock value: n value: t ] ]
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [
	| a |
	a := cache
			at: aNode
			ifAbsentPut: [ Array new: TypInfCurrentConfiguration value maxIterations + 1 ].
	^ a at: iteration put: (a at: iteration put: aType)
]

{ #category : #accessing }
TypInfState >> changes [
	| changes |
	changes := cache species new: cache size.
	cache
		associationsDo: [ :a | 
			| old new |
			old := a value at: iteration - 1 ifAbsent: nil.
			new := a value at: iteration ifAbsent: nil.
			old = new ifFalse: [ changes at: a key put: new ] ].
	^ changes
]

{ #category : #accessing }
TypInfState >> initialize [
	super initialize.
	cache := IdentityDictionary new: 1000. "avoids grow for most graphs"
	iteration := 0
]

{ #category : #accessing }
TypInfState >> iteration [
	^ iteration
]

{ #category : #accessing }
TypInfState >> last [
	| result |
	result := cache species new: cache size.
	self lastKeysAndValuesDo: [ :n :t | result at: n put: t ].
	^ result
]

{ #category : #accessing }
TypInfState >> lastKeysAndValuesDo: aBlock [
	^ self at: iteration keysAndValuesDo: aBlock
]

{ #category : #accessing }
TypInfState >> postCopy [
	| newCache |
	super postCopy.
	newCache := cache species new: 1000.
	iteration > 0
		ifTrue: [ iteration := 1.
			self
				lastKeysAndValuesDo: [ :n :t | 
					| a |
					a := Array new: TypInfCurrentConfiguration value maxIterations.
					a at: iteration put: t.
					newCache at: n put: a ] ].
	cache := newCache
]

{ #category : #accessing }
TypInfState >> reduceTo: aCollection [
	| newCache |
	newCache := IdentityDictionary new: aCollection size.
	aCollection
		do: [ :n | 
			cache
				at: n
				ifPresent: [ :a | (a at: iteration) ifNotNil: [ :t | newCache at: n put: {t} ] ] ].
	cache := newCache.
	iteration := 1
]

{ #category : #accessing }
TypInfState >> slurpAll: aCollection [
	iteration := iteration + 1.
	aCollection
		do: [ :s | s lastKeysAndValuesDo: [ :n :t | self at: n covariantPut: t ] ]
]
