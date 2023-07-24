Extension { #name : #BlElement }

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodBackground: aLookup [
	<typShaMethod: 'background:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {{Color typAsType.
					BlBackground typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodConstraintsDo: aLookup [
	<typShaMethod: 'constraintsDo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlockClosure
					typAsFunctionTypeWithResult: TypUnknownType instance
					arguments: {BlLayoutConstraints typAsType}}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodFireEvent: aLookup [
	<typShaMethod: 'fireEvent:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlEvent typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodGeometry: aLookup [
	<typShaMethod: 'geometry:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlElementGeometry typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodLook: aLookup [
	<typShaMethod: 'look:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {{BrLook class typAsType.
					BrLook typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Bloc' }
BlElement >> typShaMethodMargin: aLookup [
	<typShaMethod: 'margin:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {BlInsets typAsType}
]
