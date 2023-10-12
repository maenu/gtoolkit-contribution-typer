Extension { #name : #LargeInteger }

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryDivide: aLookup [
	<typShaMethod: '/'>
	^ super typShaMethodBinaryDivide: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryEqual: aLookup [
	<typShaMethod: '='>
	^ super typShaMethodBinaryEqual: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryGreater: aLookup [
	<typShaMethod: '>'>
	^ super typShaMethodBinaryGreater: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryIntegerDivide: aLookup [
	<typShaMethod: '//'>
	^ super typShaMethodBinaryIntegerDivide: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryLess: aLookup [
	<typShaMethod: '<'>
	^ super typShaMethodBinaryLess: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryMinus: aLookup [
	<typShaMethod: '-'>
	^ super typShaMethodBinaryMinus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryModulo: aLookup [
	<typShaMethod: '\\'>
	^ super typShaMethodBinaryModulo: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryMultiply: aLookup [
	<typShaMethod: '*'>
	^ super typShaMethodBinaryMultiply: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryNotEqual: aLookup [
	<typShaMethod: '~='>
	^ super typShaMethodBinaryNotEqual: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodBinaryPlus: aLookup [
	<typShaMethod: '+'>
	^ super typShaMethodBinaryPlus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordBitAnd: aLookup [
	<typShaMethod: 'bitAnd:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordBitOr: aLookup [
	<typShaMethod: 'bitOr:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordBitShift: aLookup [
	<typShaMethod: 'bitShift:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	^ super typShaMethodKeywordBitXor: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordByteAt: aLookup [
	<typShaMethod: 'byteAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordByteAtPut: aLookup [
	<typShaMethod: 'byteAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordQuo: aLookup [
	<typShaMethod: 'quo:'>
	^ super typShaMethodKeywordQuo: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordRem: aLookup [
	<typShaMethod: 'rem:'>
	^ super typShaMethodKeywordRem: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordRfMinus: aLookup [
	<typShaMethod: 'rfMinus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordRfPlus: aLookup [
	<typShaMethod: 'rfPlus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodUnaryBytesCount: aLookup [
	<typShaMethod: 'bytesCount'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
