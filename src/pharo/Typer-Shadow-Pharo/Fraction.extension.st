Extension { #name : #Fraction }

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryGreater: aLookup root: anotherLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryGreaterOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryLess: aLookup root: anotherLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Fraction >> typShaMethodBinaryLessOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]
