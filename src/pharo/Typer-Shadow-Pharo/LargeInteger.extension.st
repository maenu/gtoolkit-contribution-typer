Extension { #name : #LargeInteger }

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
