Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeRecursive [
	<typTypeResultAs: 'TypType'>
	^ TypParametricType new
		type: Array typAsType asNonParametricType;
		parameters: {(contents ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (contents collect: #typType) typAsType ])};
		yourself
]
