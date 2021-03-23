Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typInfHasDefiningType ].
	^ TypUnknownType new
		addOrigin: (TypInfNodeOrigin node: self);
		yourself
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfHasDefiningType [
	<typTypeResultAs: 'Boolean'>
	^ false
]
