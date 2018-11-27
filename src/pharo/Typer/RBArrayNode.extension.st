Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeWithDiscovered: aDictionary [
	^ aDictionary
		at: self
		ifAbsentPut: [ TypParametricType new
				clazz: Array;
				parameters: {(self statements collect: [ :e | e typTypeWithDiscovered: aDictionary ]) typAsType};
				yourself ]
]
