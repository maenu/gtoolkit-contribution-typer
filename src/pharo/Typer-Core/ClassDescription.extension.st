Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithArguments: aCollection result: aType argumentsOptional: aBoolean [
	| indexedVariables |
	indexedVariables := (0 to: aCollection size)
		collect: [ :e | ('@' , e asString) typAsType ].
	^ self
		typAsFunctionTypeWithArgumentsSize: aCollection size
		argumentsOptional: aBoolean
		bindings:
			((({aType} , aCollection
				select: [ :e | e isTypeVariable and: [ (indexedVariables includes: e) not ] ])
				collect: [ :e | e -> e ]) , {('@0' typAsType -> aType)}
				,
					(aCollection
						withIndexCollect: [ :e :i | ('@' , i asString) typAsType -> e ]))
				typAsTypeVariableBindings
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithArgumentsSize: anInteger argumentsOptional: aBoolean [
	^ TypFunctionType
		classDescription: self
		argumentsSize: anInteger
		argumentsOptional: aBoolean
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
	<typTypeResultAs: 'TypNamedType'>
	^ TypNamedType classDescription: self
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
ClassDescription >> typAsType [
	<typTypeResultAs: 'TypType'>
	^ TypClassLookupIndex instance
		typeFor:
			(TypClassDescriptionLookup new
				classDescription: self;
				yourself)
]

{ #category : #'*Typer-Core' }
ClassDescription >> typTypeForVariable: aSymbol [
	<typTypeArgument: 1 as: 'Symbol'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typAsType.
	^ TypVariableLookupIndex instance
		typeFor:
			(TypVariableLookup new
				receiverType: type;
				selector: aSymbol asSymbol;
				yourself)
]
