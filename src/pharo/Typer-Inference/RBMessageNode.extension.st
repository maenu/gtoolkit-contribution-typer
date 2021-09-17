Extension { #name : 'RBMessageNode' }

{ #category : '*Typer-Inference' }
RBMessageNode >> typInfMethod [

	<typPraResult: 'TypFunctionType'>
	^ self
		  propertyAt: 'typInfMethod-' , receiver typInfType asString
		  ifAbsentPut: [ 
			  receiver typInfType
				  lookupMethod: selector value asSymbol
				  arguments: (arguments collect: #typInfType) ]
]

{ #category : '*Typer-Inference' }
RBMessageNode >> typInfTypeRecursive [
	^ self typInfMethod result
]
