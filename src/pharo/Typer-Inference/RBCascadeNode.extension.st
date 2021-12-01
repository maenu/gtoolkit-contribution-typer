Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Inference' }
RBCascadeNode >> typInfTypeRecursiveIn: aContext [

	^ (messages collect: [ :e | e typInfTypeIn: aContext ]) last
]
