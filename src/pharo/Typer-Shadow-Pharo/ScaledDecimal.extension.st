Extension { #name : #ScaledDecimal }

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodBinary1: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodBinary2: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodBinary3: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodBinary4: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodNegated: aLookup [
	<typShaMethod: 'negated'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
ScaledDecimal >> typShaMethodReciprocal: aLookup [
	<typShaMethod: 'reciprocal'>
	^ CompiledMethod typAsFunctionTypeWithResult: Number typAsType
]
