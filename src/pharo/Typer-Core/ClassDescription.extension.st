Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithResult: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: anotherBoolean [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 2 as: 'TypType'>
	^ TypFunctionType
		classDescription: self
		result: aType
		arguments: aCollection
		argumentsOptional: aBoolean
		signalsAlways: anotherBoolean
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsNamedType [
	^ TypNamedType classDescription: self
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsNamedTypeWithSuperTypeParameters: anOrderedDictionary [
	| type |
	type := self typAsNamedType.
	type superType: (type superType copyWithParameters: anOrderedDictionary).
	^ type
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsParametricTypeWithParameters: anOrderedDictionary [
	^ TypParametricType
		classDescription: self
		parameters: anOrderedDictionary
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsParametricTypeWithParameters: anOrderedDictionary superTypeParameters: anotherOrderedDictionary [
	| type |
	type := self typAsParametricTypeWithParameters: anOrderedDictionary.
	type
		superType: (type superType copyWithParameters: anotherOrderedDictionary).
	^ type
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsType [
	^ TypTypeLookupIndex instance
		typeFor: (TypTypeLookup classDescription: self)
]
