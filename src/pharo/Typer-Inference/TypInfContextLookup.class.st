Class {
	#name : #TypInfContextLookup,
	#superclass : #TypLookup,
	#instVars : [
		'selfType',
		'superType',
		'arguments',
		'node'
	],
	#category : #'Typer-Inference-Lookup'
}

{ #category : #accessing }
TypInfContextLookup class >> node: aNode arguments: aCollection [
	^ self
		node: aNode
		arguments: aCollection
		self: nil
		super: nil
]

{ #category : #accessing }
TypInfContextLookup class >> node: aNode arguments: aCollection self: aTypeOrNil super: anotherTypeOrNil [
	^ self index
		typAt: {aNode identityHash.
				aTypeOrNil.
				anotherTypeOrNil.
				aCollection size} , aCollection
		ifAbsentPut: [ self new
				initializeNode: aNode
					arguments: aCollection asArray
					self: aTypeOrNil
					super: anotherTypeOrNil;
				yourself ]
]

{ #category : #accessing }
TypInfContextLookup class >> resolver [
	^ resolver ifNil: [ resolver := TypInfContextResolver new ]
]

{ #category : #accessing }
TypInfContextLookup >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject node == node ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ anObject arguments = arguments
]

{ #category : #'as yet unclassified' }
TypInfContextLookup >> absorbed: aLookup [
	^ self class
		node: node
		arguments: (arguments
				with: aLookup arguments
				collect: [ :a :b | a covariant: b ])
		self: (selfType covariant: aLookup self)
		super: (superType
				ifNil: [ aLookup super ]
				ifNotNil: [ aLookup super ifNil: [ superType ] ifNotNil: [ :t | superType covariant: t ] ])
]

{ #category : #accessing }
TypInfContextLookup >> arguments [
	^ arguments
]

{ #category : #accessing }
TypInfContextLookup >> canAbsorb: aLookup [
	node == aLookup node ifFalse: [ ^ false ].
	(selfType covariant: aLookup self) isUnion ifTrue: [ ^ false ].
	(superType
		ifNil: [ aLookup super ]
		ifNotNil: [ aLookup super ifNil: [ superType ] ifNotNil: [ :t | superType covariant: t ] ])
		ifNotNil: [ :t | t isUnion ifTrue: [ ^ false ] ].
	^ true
]

{ #category : #accessing }
TypInfContextLookup >> hash [
	^ ((node identityHash bitXor: arguments hash) bitXor: selfType hash)
		bitXor: superType hash
]

{ #category : #accessing }
TypInfContextLookup >> initializeNode: aNode arguments: aCollection self: aTypeOrNil super: anotherTypeOrNil [
	node := aNode.
	arguments := aCollection.
	selfType := aTypeOrNil.
	superType := anotherTypeOrNil
]

{ #category : #accessing }
TypInfContextLookup >> node [
	^ node
]

{ #category : #accessing }
TypInfContextLookup >> printOn: aStream [
	aStream
		nextPut: ${;
		nextPutAll: (' ' join: (arguments collect: #asString));
		nextPut: $};
		nextPut: $ .
	super printOn: aStream
]

{ #category : #accessing }
TypInfContextLookup >> reset [
	result := nil
]

{ #category : #accessing }
TypInfContextLookup >> result [
	super result ifNil: [ ^ nil ].
	result root ifNil: [ result run ].
	^ result
]

{ #category : #accessing }
TypInfContextLookup >> resultAsync [
	^ [ self result ] typAsAsyncFuture typAwait
]

{ #category : #accessing }
TypInfContextLookup >> resultAsyncFor: aDuration [
	^ [ self result ] typAsAsyncFuture typAwaitFor: aDuration
]

{ #category : #accessing }
TypInfContextLookup >> resultAsyncWithTallyFor: aDuration [
	| tally |
	tally := MessageTally new.
	^ ([ tally spyEvery: 1 on: [ self result ] ] typAsAsyncFuture
		typAwaitFor: aDuration) then: [ tally ] otherwise: [ tally ]
]

{ #category : #accessing }
TypInfContextLookup >> self [
	^ selfType
]

{ #category : #accessing }
TypInfContextLookup >> super [
	^ superType
]
