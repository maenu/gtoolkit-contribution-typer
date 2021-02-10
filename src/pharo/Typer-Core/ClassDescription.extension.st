Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithArguments: aCollection result: aType argumentsOptional: aBoolean [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 2 as: 'TypType'>
	^ self
		typAsFunctionTypeWithArgumentsSize: aCollection size
		argumentsOptional: aBoolean
		bindings:
			({('@0' -> aType)}
				, (aCollection withIndexCollect: [ :e :i | ('@' , i asString) -> e ]))
				asDictionary
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithArgumentsSize: anInteger argumentsOptional: aBoolean bindings: aBindings [
	^ TypFunctionType
		classDescription: self
		argumentsSize: anInteger
		argumentsOptional: aBoolean
		bindings: aBindings
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
		typeFor:
			(TypTypeLookup
				origin: TypLookupNilOrigin instance
				classDescription: self)
]
