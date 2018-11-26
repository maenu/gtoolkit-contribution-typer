Extension { #name : #RBMethodNode }

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	^ TypMethodResolvers instance typTypeForArgumentAt: anInteger ofMethod: self methodClass typAsType -> selector withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForArgumentNamed: aSymbol withDiscovered: aSet [
	| i |
	i := arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i withDiscovered: aSet
]

{ #category : #'*Typer' }
RBMethodNode >> typTypeForResultWithDiscovered: aSet [
	^ TypMethodResolvers instance typTypeForResultOfMethod: self methodClass typAsType -> selector withDiscovered: aSet
]
