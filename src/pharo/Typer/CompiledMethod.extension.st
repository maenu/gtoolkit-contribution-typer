Extension { #name : #CompiledMethod }

{ #category : #'*Typer' }
CompiledMethod >> typTypeForArgumentAt: anInteger [
	^ self typTypeForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForArgumentAt: anInteger withDiscovered: aSet [
	^ TypMethodResolvers instance typTypeForArgumentAt: anInteger ofMethod: self withDiscovered: aSet
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForArgumentNamed: aSymbol [
	^ self typTypeForArgumentNamed: aSymbol withDiscovered: Set new
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForArgumentNamed: aSymbol withDiscovered: aSet [
	| i |
	i := self ast arguments detectIndex: [ :f | f name = aSymbol ].
	^ self typTypeForArgumentAt: i withDiscovered: aSet
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForResult [
	^ self typTypeForResultWithDiscovered: Set new
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForResultForReceiver: aType withDiscovered: aSet [
	^ TypMethodResolvers instance typTypeForResultForReceivers: aType ofMethod: self withDiscovered: aSet
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForResultForReceivers: aType [
	^ self typTypeForResultForReceiver: aType withDiscovered: Set new
]

{ #category : #'*Typer' }
CompiledMethod >> typTypeForResultWithDiscovered: aSet [
	^ TypMethodResolvers instance typTypeForResultOfMethod: self withDiscovered: aSet
]
