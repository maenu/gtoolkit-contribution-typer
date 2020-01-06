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
ClassDescription >> typAsNamedTypeWithSuperTypeBindings: aDictionary [
	| type |
	type := self typAsNamedType.
	type superType: (type superType copyWithBindings: aDictionary).
	^ type
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsParametricTypeWithParameters: aSequenceableCollection [
	^ TypParametricType
		classDescription: self
		parameters: aSequenceableCollection
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsParametricTypeWithParameters: aSequenceableCollection bindings: aBindings [
	^ TypParametricType
		classDescription: self
		parameters: aSequenceableCollection
		bindings: aBindings
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsParametricTypeWithParameters: aSequenceableCollection bindings: aDictionary superTypeBindings: anotherDictionary [
	| type |
	type := self
		typAsParametricTypeWithParameters: aSequenceableCollection
		bindings: aDictionary.
	type superType: (type superType copyWithBindings: anotherDictionary).
	^ type
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsType [
	^ TypClassDescriptionLookupIndex instance
		typeFor:
			(TypClassDescriptionLookup new
				classDescription: self;
				yourself)
]

{ #category : #'*Typer-Core' }
ClassDescription >> typTypeForVariable: aSymbol [
	| type |
	type := self typAsType.
	^ TypVariableLookupIndex instance
		typeFor:
			(TypVariableLookup new
				receiverType: type;
				selector: aSymbol;
				yourself)
]
