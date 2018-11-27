Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ TypParametricType new
		type: Array typAsType;
		parameters: {(statements ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (statements collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType ])};
		yourself
]
