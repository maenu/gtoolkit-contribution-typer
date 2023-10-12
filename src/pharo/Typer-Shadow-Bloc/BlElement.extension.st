Extension { #name : #BlElement }

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordBackground: aLookup [
	<typShaMethod: 'background:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Color typAsType.
					BlBackground typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordConstraintsDo: aLookup [
	<typShaMethod: 'constraintsDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BlLayoutConstraints typAsType}}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordFireEvent: aLookup [
	<typShaMethod: 'fireEvent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlEvent typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordGeometry: aLookup [
	<typShaMethod: 'geometry:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlElementGeometry typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordLook: aLookup [
	<typShaMethod: 'look:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{BrLook class typAsType.
					BrLook typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordMargin: aLookup [
	<typShaMethod: 'margin:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlInsets typAsType}
]
