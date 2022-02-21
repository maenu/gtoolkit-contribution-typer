Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfFlow [

	^ TypInfFlowMessage node: self
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfMethodIn: aContext [

	self flag: 'REMOVE'.
	^ (receiver typInfTypeIn: aContext)
		  lookupMethod: selector value asSymbol
		  arguments: (arguments collect: [ :e | e typInfTypeIn: aContext ])
]
