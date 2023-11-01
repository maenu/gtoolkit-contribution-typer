Extension { #name : #BlElement }

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordBackground: aLookup root: anotherLookup [
	<typShaMethod: 'background:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{Color typAsType.
					BlBackground typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordConstraintsDo: aLookup root: anotherLookup [
	<typShaMethod: 'constraintsDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BlLayoutConstraints typAsType}}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordFireEvent: aLookup root: anotherLookup [
	<typShaMethod: 'fireEvent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlEvent typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordGeometry: aLookup root: anotherLookup [
	<typShaMethod: 'geometry:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlElementGeometry typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordLook: aLookup root: anotherLookup [
	<typShaMethod: 'look:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {{BrLook class typAsType.
					BrLook typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodKeywordMargin: aLookup root: anotherLookup [
	<typShaMethod: 'margin:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {BlInsets typAsType}
]
