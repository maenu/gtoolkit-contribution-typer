Extension { #name : #Integer }

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryDivide: aLookup [
	<typShaMethod: '/'>
	^ super typShaMethodBinaryDivide: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryEqual: aLookup [
	<typShaMethod: '='>
	^ super typShaMethodBinaryEqual: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryGreater: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryGreaterOrEqual: aLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryIntegerDivision: aLookup [
	<typShaMethod: '//'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryLess: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryLessOrEqual: aLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryMinus: aLookup [
	<typShaMethod: '-'>
	^ super typShaMethodBinaryMinus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryMultiply: aLookup [
	<typShaMethod: '*'>
	^ super typShaMethodBinaryMultiply: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryPlus: aLookup [
	<typShaMethod: '+'>
	^ super typShaMethodBinaryPlus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodKeywordBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodKeywordQuo: aLookup [
	<typShaMethod: 'quo:'>
	^ super typShaMethodKeywordQuo: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodUnaryAsCharacter: aLookup [
	<typShaMethod: 'asCharacter'>
	^ CompiledMethod typAsFunctionTypeWithResult: Character typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodUnaryAtRandom: aLookup [
	<typShaMethod: 'atRandom'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
