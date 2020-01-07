Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Core' }
RBLiteralValueNode >> typTypeRecursiveIn: aContext [
	^ (self value "typCastAs Object") typSelfType
]
