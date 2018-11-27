Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ TypParametricType new
		type: Array typAsType;
		parameters: {(contents ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (contents collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType ])};
		yourself
]
