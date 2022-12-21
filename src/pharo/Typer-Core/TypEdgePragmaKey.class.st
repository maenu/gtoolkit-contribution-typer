Class {
	#name : #TypEdgePragmaKey,
	#superclass : #TypEdgeKey,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Typer-Core-Graph'
}

{ #category : #'instance creation' }
TypEdgePragmaKey class >> selector: aSelector arguments: aCollection [

	^ self index
		  at: { 
				  aSelector asSymbol.
				  aCollection asArray }
		  ifAbsentPut: [ 
			  self new
				  initializeSelector: aSelector asSymbol
				  arguments: aCollection asArray;
				  yourself ]
]

{ #category : #comparing }
TypEdgePragmaKey >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class == self class ifFalse: [ ^ false ].
	^ anObject selector = selector and: [ anObject arguments = arguments ]
]

{ #category : #accessing }
TypEdgePragmaKey >> arguments [

	^ arguments
]

{ #category : #comparing }
TypEdgePragmaKey >> hash [

	^ (self class hash bitXor: selector hash) bitXor: arguments hash
]

{ #category : #initialization }
TypEdgePragmaKey >> initializeSelector: aSelector arguments: aCollection [

	selector := aSelector.
	arguments := aCollection
]

{ #category : #printing }
TypEdgePragmaKey >> printOn: aStream [

	selector printOn: aStream.
	aStream nextPutAll: ' {'.
	arguments withIndexDo: [ :e :i | 
		e printOn: aStream.
		i < arguments size ifTrue: [ aStream nextPut: $, ] ].
	aStream nextPut: $}
]

{ #category : #accessing }
TypEdgePragmaKey >> selector [

	^ selector
]
