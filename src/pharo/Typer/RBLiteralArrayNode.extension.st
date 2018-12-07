Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeRecursive [
	^ Array typAsType asParametricType: {(self contents ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (self contents collect: #typType) typAsType ])}
]
