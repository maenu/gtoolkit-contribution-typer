Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithArguments: aCollection result: aType argumentsOptional: aBoolean [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 2 as: 'TypType'>
	^ self
		typAsFunctionTypeWithArgumentsSize: aCollection size
		argumentsOptional: aBoolean
		parameters:
			({('@0' -> aType)}
				, (aCollection withIndexCollect: [ :e :i | ('@' , i asString) -> e ]))
				asOrderedDictionary
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithArgumentsSize: anInteger argumentsOptional: aBoolean parameters: aBindings [
	^ TypFunctionType
		classDescription: self
		argumentsSize: anInteger
		argumentsOptional: aBoolean
		parameters: aBindings
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
