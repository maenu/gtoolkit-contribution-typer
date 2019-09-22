Extension { #name : #ClassDescription }

{ #category : #'*Typer-Core' }
ClassDescription >> typAsNamedType [
	<typTypeResultAs: 'TypNamedType'>
	^ (TypNamedType named: self name)
		clazz: self;
		yourself
]

{ #category : #'*Typer-Core' }
ClassDescription >> typAsType [
	<typTypeResultAs: 'TypType'>
	^ TypClassLookupIndex instance
		typeFor:
			(TypClassLookup new
				clazz: self;
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
