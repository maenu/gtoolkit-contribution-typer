Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Inference' }
RBSequenceNode >> typInfFlow [

	^ TypInfFlowSequence node: self
]
