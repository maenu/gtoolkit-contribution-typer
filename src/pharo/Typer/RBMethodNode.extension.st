Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typKnownArgumentTypesWithDiscovered: aSet [
	^ arguments collect: [ :f | f typTypeWithDiscovered: aSet ]
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	^ TypMethodResolvers instance
		typeForArgumentAt: anInteger
		ofMethod: self methodClass typAsType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aSet))
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aSet [
	| i |
	i := arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResultWithDiscovered: aSet [
	^ TypMethodResolvers instance typeForResultOfMethod: self methodClass typAsType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aSet))
]
