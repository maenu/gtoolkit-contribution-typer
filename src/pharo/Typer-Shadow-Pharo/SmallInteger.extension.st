Extension { #name : #SmallInteger }

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordBitAnd: aLookup root: anotherLookup [
	<typShaMethod: 'bitAnd:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordBitOr: aLookup root: anotherLookup [
	<typShaMethod: 'bitOr:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordBitShift: aLookup root: anotherLookup [
	<typShaMethod: 'bitShift:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordRfMinus: aLookup root: anotherLookup [
	<typShaMethod: 'rfMinus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordRfPlus: aLookup root: anotherLookup [
	<typShaMethod: 'rfPlus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodUnaryAsFloat: aLookup root: anotherLookup [
	<typShaMethod: 'asFloat'>
	^ CompiledMethod typAsFunctionTypeWithResult: Float typAsType
]
