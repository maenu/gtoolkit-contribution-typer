Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfFlow [

	^ TypInfFlowLiteralArray node: self
]
