Extension { #name : #Key }

{ #category : #'*Typer-Shadow-Pharo' }
Key class >> typShaMethodH: aLookup [
	<typShaMethod: 'h'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyboardKey typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Key class >> typShaMethodT: aLookup [
	<typShaMethod: 't'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyboardKey typAsType
]
