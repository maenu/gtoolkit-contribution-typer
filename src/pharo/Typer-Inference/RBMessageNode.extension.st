Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfMethodIn: aContext [

	^ (receiver typInfTypeIn: aContext)
		  lookupMethod: selector value asSymbol
		  arguments: (arguments collect: [ :e | e typInfTypeIn: aContext ])
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfTypeRecursiveIn: aContext [

	receiver typInfTypeIn: aContext.
	arguments do: [ :e | e typInfTypeIn: aContext ].
	^ (self typInfMethodIn: aContext) result
]
