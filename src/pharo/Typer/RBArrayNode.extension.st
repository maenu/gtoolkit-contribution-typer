Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeRecursive [
	^ Array typAsType asParametricType: {(self statements ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (self statements collect: #typType) typAsType ])}
]
