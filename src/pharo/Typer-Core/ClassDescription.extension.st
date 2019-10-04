Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core' }
ClassDescription >> typAsNamedType [
	<typTypeResultAs: 'TypNamedType'>
	^ TypNamedType classDescription: self
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsParametricType: someBindings [
	^ TypParametricType classDescription: self bindings: someBindings
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
	<typTypeArgument: 1 as: 'Symbol<Character>'>
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
