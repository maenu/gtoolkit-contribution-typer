Class {
	#name : #TypInfMethodNodeStack,
	#superclass : #ProcessLocalVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfMethodNodeStack class >> push: aNode during: aBlock or: anotherBlock [

	| stack |
	stack := self stack.
	(stack includes: aNode) ifTrue: [ ^ anotherBlock value ].
	stack push: aNode.
	^ aBlock ensure: [ stack pop ]
]

{ #category : #accessing }
TypInfMethodNodeStack class >> stack [

	^ self value ifNil: [ 
		  self value: Stack new.
		  self value ]
]
