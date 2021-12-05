Class {
	#name : #TypInfMethodNodeStack,
	#superclass : #DynamicVariable,
	#category : #'Typer-Inference'
}

{ #category : #api }
TypInfMethodNodeStack class >> during: aBlock [

	^ self value: Stack new during: aBlock
]

{ #category : #testing }
TypInfMethodNodeStack class >> includes: aNode [

	^ self value identityIncludes: aNode
]

{ #category : #adding }
TypInfMethodNodeStack class >> pop [

	^ self value pop
]

{ #category : #adding }
TypInfMethodNodeStack class >> push: aNode [

	^ self value push: aNode
]

{ #category : #'as yet unclassified' }
TypInfMethodNodeStack class >> push: aNode during: aBlock [

	self push: aNode.
	^ aBlock ensure: [ self pop ]
]
