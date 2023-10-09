Extension { #name : #Array }

{ #category : #'*Typer-Shadow-Pharo' }
Array class >> typShaMethodNew2: aLookup [
	<typShaMethod: 'new:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root self classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]
