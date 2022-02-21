Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Inference' }
RBLiteralValueNode >> typInfFlow [

	^ TypInfFlowLiteral node: self
]
