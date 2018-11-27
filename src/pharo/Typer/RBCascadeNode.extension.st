Extension { #name : #RBCascadeNode }

{ #category : #'*Typer' }
RBCascadeNode >> typTypeWithDiscovered: aDictionary [
	^ messages last typTypeWithDiscovered: aDictionary
]
