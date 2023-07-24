Extension { #name : #BlLayoutCommonConstraintsAxis }

{ #category : #'*Typer-Shadow-Bloc' }
BlLayoutCommonConstraintsAxis >> typShaMethodExact: aLookup [
	<typShaMethod: 'exact:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {Number typAsType}
]
