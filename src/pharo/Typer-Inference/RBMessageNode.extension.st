Extension { #name : #RBMessageNode }

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfMethod [

	^ self typInfMethodSelf: self typInfSelf
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfMethodSelf: aType [

	<typPraResult: 'TypFunctionType'>
	| prefix |
	prefix := 'typInf-' , aType hash asString , '-method'.
	^ self
		  propertyAt: prefix
		  ifAbsent: [ "need to set property to default to unknown on recursive calls"
			  self
				  propertyAt: prefix put: (self typInfUnknownSelf: aType);
				  propertyAt: prefix put: ((receiver typInfTypeSelf: aType)
						   lookupMethod: selector value asSymbol
						   arguments:
							   (arguments collect: [ :e | e typInfTypeSelf: aType ])) ]
]

{ #category : #'*Typer-Inference' }
RBMessageNode >> typInfTypeRecursiveSelf: aType [

	^ (self typInfMethodSelf: aType) result
]
