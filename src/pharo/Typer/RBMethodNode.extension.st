Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typKnownArgumentTypesWithDiscovered: aDictionary [
	^ arguments collect: [ :f | f typTypeWithDiscovered: aDictionary ]
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentAt: anInteger withDiscovered: aDictionary [
	^ TypMethodResolvers instance
		typeForArgumentAt: anInteger
		ofMethod: self methodClass typAsType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aDictionary))
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aDictionary [
	| i |
	i := arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i withDiscovered: aDictionary
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResultWithDiscovered: aDictionary [
	^ TypMethodResolvers instance typeForResultOfMethod: self methodClass typAsType -> (selector -> (self typKnownArgumentTypesWithDiscovered: aDictionary))
]
