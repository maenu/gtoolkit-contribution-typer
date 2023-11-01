Extension { #name : #Integer }

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryGreater: aLookup root: anotherLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryGreaterOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '>='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryIntegerDivide: aLookup root: anotherLookup [
	<typShaMethod: '//'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryLess: aLookup root: anotherLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryLessOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryMinus: aLookup root: anotherLookup [
	<typShaMethod: '-'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments first <= Integer typAsType
				ifTrue: [ Integer typAsType ]
				ifFalse: [ Number typAsType ])
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryModulo: aLookup root: anotherLookup [
	<typShaMethod: '\\'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments first <= Integer typAsType
				ifTrue: [ Integer typAsType ]
				ifFalse: [ Number typAsType ])
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryMultiply: aLookup root: anotherLookup [
	<typShaMethod: '*'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments first <= Integer typAsType
				ifTrue: [ Integer typAsType ]
				ifFalse: [ Number typAsType ])
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodBinaryPlus: aLookup root: anotherLookup [
	<typShaMethod: '+'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments first <= Integer typAsType
				ifTrue: [ Integer typAsType ]
				ifFalse: [ Number typAsType ])
		arguments: {Number typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodKeywordBitXor: aLookup root: anotherLookup [
	<typShaMethod: 'bitXor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Integer typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodUnaryAsCharacter: aLookup root: anotherLookup [
	<typShaMethod: 'asCharacter'>
	^ CompiledMethod typAsFunctionTypeWithResult: Character typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Integer >> typShaMethodUnaryAtRandom: aLookup root: anotherLookup [
	<typShaMethod: 'atRandom'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]
