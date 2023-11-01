Extension { #name : #Magnitude }

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinaryGreater: aLookup root: anotherLookup [
	<typShaMethod: '>'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinaryLess: aLookup root: anotherLookup [
	<typShaMethod: '<'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodBinaryLessOrEqual: aLookup root: anotherLookup [
	<typShaMethod: '<='>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodKeywordMax: aLookup root: anotherLookup [
	<typShaMethod: 'max:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup self.
				aLookup arguments at: 1} typAsType
		arguments: {Magnitude typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Magnitude >> typShaMethodKeywordMin: aLookup root: anotherLookup [
	<typShaMethod: 'min:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: {aLookup self.
				aLookup arguments at: 1} typAsType
		arguments: {Magnitude typAsType}
]
