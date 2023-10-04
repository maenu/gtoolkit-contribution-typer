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

	^ TypTypeIndex instance lookupClassDescription: self
]
