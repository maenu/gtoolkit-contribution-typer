Extension { #name : #RBSelfNode }

{ #category : #'*Typer-Core' }
RBSelfNode >> typTypeRecursiveIn: aContext [
	^ aContext selfType
]
