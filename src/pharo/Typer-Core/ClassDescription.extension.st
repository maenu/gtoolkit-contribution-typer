Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithResult: aType [
	^ self typAsFunctionTypeWithResult: aType arguments: #()
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithResult: aType arguments: aCollection [
	^ self
		typAsFunctionTypeWithResult: aType
		arguments: aCollection
		argumentsOptional: false
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithResult: aType arguments: aCollection argumentsOptional: aBoolean [
	^ self
		typAsFunctionTypeWithResult: aType
		arguments: aCollection
		argumentsOptional: aBoolean
		signalsAlways: nil
		signalsMaybe: nil
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsFunctionTypeWithResult: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil [
	^ TypFunctionType
		classDescription: self
		result: aType
		arguments: aCollection
		argumentsOptional: aBoolean
		signalsAlways: aTypeOrNil
		signalsMaybe: anotherTypeOrNil
		node: nil
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsNamedType [
	^ TypNamedType classDescription: self
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsParametricTypeWithParameters: aDictionary [
	^ TypParametricType classDescription: self parameters: aDictionary
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsType [
	^ (TypTypeLookup classDescription: self) resultOrUnknown
]

{ #category : #'*Typer-Core' }
ClassDescription >> typDependsOnClassDescription: aClassDescription [
	^ aClassDescription = self or: [ aClassDescription inheritsFrom: self ]
]
