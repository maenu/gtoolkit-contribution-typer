Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfFlow [

	^ TypInfFlowVariable node: self
]

{ #category : #'*Typer-Inference' }
RBVariableNode >> typInfFlowAddTo: aSet [

	variable typInfFlowAddTo: aSet
]
