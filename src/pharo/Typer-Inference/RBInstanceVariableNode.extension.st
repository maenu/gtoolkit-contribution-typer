Extension { #name : #RBInstanceVariableNode }

{ #category : #'*Typer-Inference' }
RBInstanceVariableNode >> typInfDefiningType [
	<typPraResult: 'Type'>
	self assert: [ self typInfHasDefiningType ].
	^ TypInfSelf value
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
