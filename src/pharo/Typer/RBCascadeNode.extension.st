Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typTypesWithDiscovered: aSet [
	^ messages last typTypesWithDiscovered: aSet
]
