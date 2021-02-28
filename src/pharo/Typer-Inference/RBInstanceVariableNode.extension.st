Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typInfDefiner [
	<typTypeResultAs: 'Type'>
	self assert: [ self typInfHasDefiner ].
	^ self methodNode typInfReceiver
]

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typInfHasDefiner [
	^ true
]

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typInfTypeRecursive [
	self typInfIsAssignedTo
		ifTrue: [ ^ self parent value typInfType ].
	^ self typInfDefiner lookupVariable: name asSymbol
]
