Class {
	#name : #TypEdgePragmaData,
	#superclass : #Object,
	#instVars : [
		'selector',
		'arguments'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypEdgePragmaData class >> selector: aSelector arguments: aCollection [

	^ self new
		  initializeSelector: aSelector arguments: aCollection;
		  yourself
]

{ #category : #comparing }
TypEdgePragmaData >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class == self class ifFalse: [ ^ false ].
	^ anObject selector = selector and: [ anObject arguments = arguments ]
]

{ #category : #accessing }
TypEdgePragmaData >> arguments [

	^ arguments
]

{ #category : #comparing }
TypEdgePragmaData >> hash [

	^ (self class hash bitXor: selector hash) bitXor: arguments hash
]

{ #category : #initialization }
TypEdgePragmaData >> initializeSelector: aSelector arguments: aCollection [

	selector := aSelector.
	arguments := aCollection
]

{ #category : #printing }
TypEdgePragmaData >> printOn: aStream [

	selector printOn: aStream.
	aStream nextPutAll: ' {'.
	arguments withIndexDo: [ :e :i | 
		e printOn: aStream.
		i < arguments size ifTrue: [ aStream nextPut: $, ] ].
	aStream nextPut: $}
]

{ #category : #accessing }
TypEdgePragmaData >> selector [

	^ selector
]
