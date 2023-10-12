Extension { #name : #SmallInteger }

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryDivide: aLookup [
	<typShaMethod: '/'>
	^ super typShaMethodBinaryDivide: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryEqual: aLookup [
	<typShaMethod: '='>
	^ super typShaMethodBinaryEqual: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryGreater: aLookup [
	<typShaMethod: '>'>
	^ super typShaMethodBinaryGreater: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryIntegerDivide: aLookup [
	<typShaMethod: '//'>
	^ super typShaMethodBinaryIntegerDivide: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryLess: aLookup [
	<typShaMethod: '<'>
	^ super typShaMethodBinaryLess: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryMinus: aLookup [
	<typShaMethod: '-'>
	^ super typShaMethodBinaryMinus: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryModulo: aLookup [
	<typShaMethod: '\\'>
	^ super typShaMethodBinaryModulo: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryMultiply: aLookup [
	<typShaMethod: '*'>
	^ super typShaMethodBinaryMultiply: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryNotEqual: aLookup [
	<typShaMethod: '~='>
	^ super typShaMethodBinaryNotEqual: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodBinaryPlus: aLookup [
	<typShaMethod: '+'>
	^ super typShaMethodBinaryPlus: aLookup
]

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
SmallInteger >> typShaMethodKeywordBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	^ super typShaMethodKeywordBitXor: aLookup
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMethodKeywordQuo: aLookup [
	<typShaMethod: 'quo:'>
	^ super typShaMethodKeywordQuo: aLookup
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
