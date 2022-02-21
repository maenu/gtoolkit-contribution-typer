Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer-Inference' }
RBLiteralArrayNode >> typInfFlow [

	^ TypInfFlowArray node: self
]
