Extension { #name : #RBArrayNode }

{ #category : #'*Typer' }
RBArrayNode >> typTypeWithDiscovered: aSet [
	^ TypParametricType new
		clazz: Array;
		parameters: {(self statements collect: [ :e | e typTypeWithDiscovered: aSet ])};
		yourself
]
