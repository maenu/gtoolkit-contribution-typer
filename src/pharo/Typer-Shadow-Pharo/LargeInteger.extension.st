Extension { #name : #LargeInteger }

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary10: aLookup [
	<typShaMethod: '\\'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary1: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary2: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary3: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary4: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary5: aLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary6: aLookup [
	<typShaMethod: '~='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary7: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary8: aLookup [
	<typShaMethod: '//'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBinary9: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBitAnd: aLookup [
	<typShaMethod: 'bitAnd:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBitOr: aLookup [
	<typShaMethod: 'bitOr:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBitShift: aLookup [
	<typShaMethod: 'bitShift:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetByteAt: aLookup [
	<typShaMethod: 'byteAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetByteAtPut: aLookup [
	<typShaMethod: 'byteAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetBytesCount: aLookup [
	<typShaMethod: 'bytesCount'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetQuo: aLookup [
	<typShaMethod: 'quo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetRem: aLookup [
	<typShaMethod: 'rem:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetRfMinus: aLookup [
	<typShaMethod: 'rfMinus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
LargeInteger >> typShaMetRfPlus: aLookup [
	<typShaMethod: 'rfPlus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]
