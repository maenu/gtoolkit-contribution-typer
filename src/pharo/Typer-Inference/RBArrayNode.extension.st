Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Inference' }
RBArrayNode >> typInfTypeRecursiveSelf: aType [

	^ Array typAsType copyWithParameters:
		  { (statements collect: [ :e | e typInfTypeSelf: aType ]) typAsType }
]
