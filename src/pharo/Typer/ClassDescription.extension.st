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
	^ TypChainableTypeResolvers instance
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
	^ TypChainableVariableResolvers instance
		typeForVariable:
			(TypVariableLookup new
				receiverType: type;
				selector: aSymbol asSymbol;
				yourself)
]
