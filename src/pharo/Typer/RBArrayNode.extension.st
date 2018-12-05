Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeRecursive [
	^ Array typAsType asParametricType: {(statements ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (statements collect: #typType) typAsType ])}
]
