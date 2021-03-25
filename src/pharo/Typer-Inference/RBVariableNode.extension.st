Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typInfHasDefiningType ].
	^ self typInfUnknown
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfHasDefiningType [
	<typTypeResultAs: 'Boolean'>
	^ false
]
