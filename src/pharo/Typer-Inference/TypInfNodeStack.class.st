Class {
	#name : #TypInfNodeStack,
	#superclass : #ProcessLocalVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfNodeStack class >> canPush: aNode [
	| stack |
	stack := self stack.
	stack size < 8 ifFalse: [ ^ false ].
	^ (stack includes: aNode) not
]

{ #category : #accessing }
TypInfNodeStack class >> push: aNode during: aBlock or: anotherBlock [
	| stack |
	stack := self stack.
	(self canPush: aNode) ifFalse: [ ^ anotherBlock value ].
	stack push: aNode.
	^ aBlock ensure: [ stack pop ]
]

{ #category : #accessing }
TypInfNodeStack class >> stack [

	^ self value ifNil: [ 
		  self value: Stack new.
		  self value ]
]
