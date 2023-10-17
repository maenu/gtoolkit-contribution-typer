Extension { #name : #SmallInteger }

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordBitAnd: aLookup [
	<typShaMethod: 'bitAnd:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordBitOr: aLookup [
	<typShaMethod: 'bitOr:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordBitShift: aLookup [
	<typShaMethod: 'bitShift:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordRfMinus: aLookup [
	<typShaMethod: 'rfMinus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordRfPlus: aLookup [
	<typShaMethod: 'rfPlus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodUnaryAsFloat: aLookup [
	<typShaMethod: 'asFloat'>
	^ CompiledMethod typAsFunctionTypeWithResult: Float typAsType
]
