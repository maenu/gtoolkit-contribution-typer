Class {
	#name : #TypEdgePragmaKey,
	#superclass : #Object,
	#instVars : [
		'selector',
		'arguments'
	],
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #initialization }
TypEdgePragmaKey class >> initialize [

	index := WeakValueDictionary new
]

{ #category : #invalidation }
TypEdgePragmaKey class >> invalidate [

	<script>
	index removeAll
]

{ #category : #'instance creation' }
TypEdgePragmaKey class >> selector: aSelector arguments: aCollection [

	^ index
		  at: { 
				  aSelector.
				  aCollection }
		  ifAbsentPut: [ 
			  self new
				  initializeSelector: aSelector arguments: aCollection;
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
