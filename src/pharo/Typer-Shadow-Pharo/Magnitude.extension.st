Extension { #name : #Magnitude }

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinaryGreater: aLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinaryLess: aLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinaryLessOrEqual: aLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodKeywordMax: aLookup [
	<typShaMethod: 'max:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup self.
				aLookup arguments at: 1} typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodKeywordMin: aLookup [
	<typShaMethod: 'min:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup self.
				aLookup arguments at: 1} typAsType
		arguments: {Magnitude typAsType}
]
