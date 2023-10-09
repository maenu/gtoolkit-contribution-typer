Extension { #name : #Integer }

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodAsCharacter: aLookup [
	<typShaMethod: 'asCharacter'>
	^ CompiledMethod typAsFunctionTypeWithResult: Character typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodAtRandom: aLookup [
	<typShaMethod: 'atRandom'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinary1: aLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinary2: aLookup [
	<typShaMethod: '//'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinary3: aLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinary4: aLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinary5: aLookup [
	<typShaMethod: '/'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBitXor: aLookup [
	<typShaMethod: 'bitXor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodQuo: aLookup [
	<typShaMethod: 'quo:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Number typAsType
		arguments: {Integer typAsType}
]
