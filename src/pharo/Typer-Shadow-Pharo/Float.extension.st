Extension { #name : #Float }

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMetAbs: aLookup [
	<typShaMethod: 'abs'>
	^ CompiledMethod typAsFunctionTypeWithResult: Float typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMetBasicAt: aLookup [
	<typShaMethod: 'basicAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMetBasicAtPut: aLookup [
	<typShaMethod: 'basicAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMetNegated: aLookup [
	<typShaMethod: 'negated'>
	^ CompiledMethod typAsFunctionTypeWithResult: Float typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Float >> typShaMetReciprocal: aLookup [
	<typShaMethod: 'reciprocal'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
