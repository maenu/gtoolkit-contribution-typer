Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfMethodIn: aContext [

	<typPraResult: 'TypFunctionType'>
	^ aContext methodAt: self ifAbsentPut: [ 
		  (receiver typInfTypeIn: aContext)
			  lookupMethod: selector value asSymbol
			  arguments: (arguments collect: [ :e | e typInfTypeIn: aContext ]) ]
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfTypeRecursiveIn: aContext [

	^ (self typInfMethodIn: aContext) result
]
