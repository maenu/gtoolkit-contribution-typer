Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithResult: aType [
	^ TypFunctionType
		classDescription: self
		result: aType
		arguments: #()
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithResult: aType arguments: aCollection [
	^ TypFunctionType
		classDescription: self
		result: aType
		arguments: aCollection
		argumentsOptional: false
		signalsAlways: false
]

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
ClassDescription >> typAsParametricTypeWithParameters: anOrderedDictionary [
	^ TypParametricType
		classDescription: self
		parameters: anOrderedDictionary
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsType [
	^ TypTypeLookupIndex instance lookupClassDescription: self
]
