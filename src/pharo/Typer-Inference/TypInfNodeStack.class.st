Class {
	#name : #TypInfNodeStack,
	#superclass : #ProcessLocalVariable,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfNodeStack class >> actives [

	^ self value ifNil: [ 
		  self value: Stack new.
		  self value ]
]

{ #category : #accessing }
TypInfNodeStack class >> canPush: aNode [
	| actives |
	actives := self actives.
	actives size < self maxSize ifFalse: [ ^ false ].
	^ (actives includes: aNode) not
]

{ #category : #accessing }
TypInfNodeStack class >> maxSize [
	^ 3
]

{ #category : #accessing }
TypInfNodeStack class >> push: aNode during: aBlock or: anotherBlock [
	| actives |
	actives := self actives.
	(self canPush: aNode) ifFalse: [ ^ anotherBlock value ].
	actives push: aNode.
	^ aBlock ensure: [ self assert: [ actives pop == aNode ] ]
]
