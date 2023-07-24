Extension { #name : #Magnitude }

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinary223: aLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinary225: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinary226: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodMax: aLookup [
	<typShaMethod: 'max:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup root receiver.
				aLookup arguments at: 1} typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodMin: aLookup [
	<typShaMethod: 'min:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup root receiver.
				aLookup arguments at: 1} typAsType
		arguments: {Magnitude typAsType}
]
