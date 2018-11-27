Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeRecursiveWithDiscovered: aDictionary [
	^ TypParametricType new
		clazz: Array;
		parameters: {(statements ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (statements collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType ])};
		yourself
]
