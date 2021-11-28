Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Inference' }
RBCascadeNode >> typInfTypeRecursiveSelf: aType [

	^ (messages collect: [ :e | e typInfTypeSelf: aType ]) last
]
