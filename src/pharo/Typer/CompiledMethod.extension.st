Extension { #name : #CompiledMethod }

{ #category : #'*Typer' }
CompiledMethod >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	^ TypMethodResolvers instance typTypeForArgumentAt: anInteger ofMethod: self withDiscovered: aSet
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForArgumentNamed: aSymbol withDiscovered: aSet [
	| i |
	i := self ast arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i withDiscovered: aSet
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForResultWithDiscovered: aSet [
	^ TypMethodResolvers instance typTypeForResultOfMethod: self withDiscovered: aSet
]
