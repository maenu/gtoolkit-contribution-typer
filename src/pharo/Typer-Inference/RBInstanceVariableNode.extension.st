Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typInfDefiningType [
	<typTypeResultAs: 'Type'>
	self assert: [ self typInfHasDefiningType ].
	^ self methodNode typInfReceiver
]

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typInfHasDefiningType [
	^ true
]

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typInfTypeRecursive [
	self isWrite
		ifTrue: [ ^ parent value typInfType ].
	^ self typInfDefiningType lookupVariable: name asSymbol
]
