Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfDefiningType [
	<typPraResult: 'Type'>
	self assert: [ self typInfHasDefiningType ].
	^ self typInfUnknown
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfHasDefiningType [
	<typPraResult: 'Boolean'>
	^ false
]
