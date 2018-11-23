Extension { #name : #CompiledMethod }

{ #category : #'*Typer' }
CompiledMethod >> typTypesForArgumentAt: anInteger [
	^ self typTypesForArgumentAt: anInteger withDiscovered: Set new
]

{ #category : #'*Typer' }
CompiledMethod >> typTypesForArgumentAt: anInteger withDiscovered: aSet [
	^ (TypMethodResolvers instance resolverFor: self) typTypesForArgumentAt: anInteger withDiscovered: aSet
]

{ #category : #'*Typer' }
CompiledMethod >> typTypesForArgumentNamed: aString [
	^ self typTypesForArgumentNamed: aString withDiscovered: Set new
]

{ #category : #'*Typer' }
CompiledMethod >> typTypesForArgumentNamed: aString withDiscovered: aSet [
	| i |
	i := self ast arguments detectIndex: [ :f | f name = aString ].
	^ self typTypesForArgumentAt: i withDiscovered: aSet
]

{ #category : #'*Typer' }
CompiledMethod >> typTypesForResult [
	^ self typTypesForResultWithDiscovered: Set new
]

{ #category : #'*Typer' }
CompiledMethod >> typTypesForResultForReceivers: aTypes [
	^ self typTypesForResultForReceivers: aTypes withDiscovered: Set new
]

{ #category : #'*Typer' }
CompiledMethod >> typTypesForResultForReceivers: aTypes withDiscovered: aSet [
	^ (TypMethodResolvers instance resolverFor: self) typTypesForResultForReceivers: aTypes withDiscovered: aSet
]

{ #category : #'*Typer' }
CompiledMethod >> typTypesForResultWithDiscovered: aSet [
	^ (TypMethodResolvers instance resolverFor: self) typTypesForResultWithDiscovered: aSet
]
