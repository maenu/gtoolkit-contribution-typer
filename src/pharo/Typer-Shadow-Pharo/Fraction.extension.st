Extension { #name : #Fraction }

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryGreater: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryGreaterOrEqual: aLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryLess: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryLessOrEqual: aLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]
