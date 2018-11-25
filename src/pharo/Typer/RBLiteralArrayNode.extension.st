Extension { #name : #RBLiteralArrayNode }

{ #category : #'*Typer' }
RBLiteralArrayNode >> typTypesWithDiscovered: aSet [
	(aSet includes: self)
		ifTrue: [ ^ TypTypes new ].
	aSet add: self.
	^ [ | type |
	type := ((self contents collect: [ :e | e typTypesWithDiscovered: aSet ]) inject: TypTypes new into: [ :a :b | a , b ]) inferredType.
	TypTypes new
		increment:
			(TypParametricType new
				clazz: Array;
				parameters: {type};
				yourself);
		yourself ]
		on: TypNoInferrableTypeError
		do: [ TypType new
				clazz: Array;
				yourself ]
]
