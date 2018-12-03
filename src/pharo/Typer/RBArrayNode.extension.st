Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeRecursive [
	^ TypParametricType new
		type: Array typAsType;
		parameters: {(statements ifEmpty: [ TypUnknownType instance ] ifNotEmpty: [ (statements collect: #typType) typAsType ])};
		yourself
]
