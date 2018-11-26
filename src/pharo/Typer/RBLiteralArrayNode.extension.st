Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypeWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypUnknownType instance ].
	aSet add: self.
	^ TypParametricType new
		clazz: Array;
		parameters: {(self contents collect: [ :e | e typTypeWithDiscovered: aSet ]) typAsCompatibleType};
		yourself
]
