Extension { #name : 'RBMessageNode' }

{ #category : '*Typer-Inference' }
RBMessageNode >> typInfMethod [

	<typPraResult: 'TypFunctionType'>
	| identifier |
	identifier := 'typInfMethod-' , receiver typInfType hash asString.
	^ self
		  propertyAt: identifier
		  ifAbsent: [ "need to set property to default to unknown on recursive calls"
			  self
				  propertyAt: identifier put: self typInfUnknown;
				  propertyAt: identifier put: (receiver typInfType
						   lookupMethod: selector value asSymbol
						   arguments: (arguments collect: #typInfType)) ]
]

{ #category : '*Typer-Inference' }
RBMessageNode >> typInfTypeRecursive [
	^ self typInfMethod result
]
