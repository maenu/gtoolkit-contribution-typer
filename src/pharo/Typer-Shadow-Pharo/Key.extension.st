Extension { #name : #Key }

{ #category : #'*Typer-Shadow-Pharo' }
Key class >> typShaMethodUnaryH: aLookup [
	<typShaMethod: 'h'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyboardKey typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Key class >> typShaMethodUnaryT: aLookup [
	<typShaMethod: 't'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyboardKey typAsType
]
