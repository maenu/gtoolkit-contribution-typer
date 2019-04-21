Extension { #name : #ClassDescription }

{ #category : #'*Typer' }
ClassDescription >> typAsNamedType [
	<typTypeResultAs: 'TypNamedType'>
	^ TypNamedType new
		name: self name;
		yourself
]

{ #category : #'*Typer' }
ClassDescription >> typAsType [
	<typTypeResultAs: 'TypType'>
	^ TypTypeResolvers instance
		typForClass:
			(TypTypeLookup new
				clazz: self;
				yourself)
]

{ #category : #'*Typer' }
ClassDescription >> typTypeForVariable: aSymbol [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	<typTypeResultAs: 'TypType'>
	| type |
	type := self typAsType.
	^ TypVariableResolvers instance
		typeForVariable:
			(TypVariableLookup new
				receiverType: type;
				selector: aSymbol asSymbol;
				yourself)
]
