Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeRecursive [
	^ Array typAsType asParametricType: {(contents ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (contents collect: #typType) typAsType ])}
]
