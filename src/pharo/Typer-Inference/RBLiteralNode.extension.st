Extension { #name : #RBLiteralNode }

{ #category : #'*Typer-Inference' }
RBLiteralNode >> typInfFlow [

	^ TypInfFlowConstant node: self
]
