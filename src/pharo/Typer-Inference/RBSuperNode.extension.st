Extension { #name : #RBSuperNode }

{ #category : #'*Typer-Inference' }
RBSuperNode >> typInfTypeRecursive [
	^ TypInfSelf value ifNil: [ TypUnknownType new ] ifNotNil: #superType
]
