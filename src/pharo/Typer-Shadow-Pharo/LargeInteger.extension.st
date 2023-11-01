Extension { #name : #LargeInteger }

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordBitAnd: aLookup root: anotherLookup [
	<typShaMethod: 'bitAnd:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordBitOr: aLookup root: anotherLookup [
	<typShaMethod: 'bitOr:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordBitShift: aLookup root: anotherLookup [
	<typShaMethod: 'bitShift:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordByteAt: aLookup root: anotherLookup [
	<typShaMethod: 'byteAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordByteAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'byteAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordRfMinus: aLookup root: anotherLookup [
	<typShaMethod: 'rfMinus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodKeywordRfPlus: aLookup root: anotherLookup [
	<typShaMethod: 'rfPlus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMethodUnaryBytesCount: aLookup root: anotherLookup [
	<typShaMethod: 'bytesCount'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
