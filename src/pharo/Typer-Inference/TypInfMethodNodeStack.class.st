Class {
	#name : #TypInfMethodNodeStack,
	#superclass : #ProcessLocalVariable,
	#category : #'Typer-Inference-Lookup'
}

{ #category : #'as yet unclassified' }
TypInfMethodNodeStack class >> push: aNode max: anInteger during: aBlock or: anotherBlock [

	| stack |
	stack := self stack.
	(stack size > anInteger or: [ stack includes: aNode ]) ifTrue: [ 
		^ anotherBlock value ].
	stack push: aNode.
	^ aBlock ensure: [ stack pop ]
]

{ #category : #accessing }
TypInfMethodNodeStack class >> stack [

	^ self value ifNil: [ 
		  self value: Stack new.
		  self value ]
]
