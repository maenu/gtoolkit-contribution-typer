Extension { #name : #SmallInteger }

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetAsFloat: aLookup [
	<typShaMethod: 'asFloat'>
	^ CompiledMethod typAsFunctionTypeWithResult: Float typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary10: aLookup [
	<typShaMethod: '\\'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary1: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary2: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary3: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary4: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary5: aLookup [
	<typShaMethod: '='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary6: aLookup [
	<typShaMethod: '~='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Boolean typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary7: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary8: aLookup [
	<typShaMethod: '//'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBinary9: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBitAnd: aLookup [
	<typShaMethod: 'bitAnd:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBitOr: aLookup [
	<typShaMethod: 'bitOr:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBitShift: aLookup [
	<typShaMethod: 'bitShift:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetQuo: aLookup [
	<typShaMethod: 'quo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetRfMinus: aLookup [
	<typShaMethod: 'rfMinus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
SmallInteger >> typShaMetRfPlus: aLookup [
	<typShaMethod: 'rfPlus:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]
