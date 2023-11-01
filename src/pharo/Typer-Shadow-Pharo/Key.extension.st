Extension { #name : #Key }

{ #category : #'*Typer-Shadow-Pharo' }
Key class >> typShaMethodUnaryH: aLookup root: anotherLookup [
	<typShaMethod: 'h'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyboardKey typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Key class >> typShaMethodUnaryT: aLookup root: anotherLookup [
	<typShaMethod: 't'>
	^ CompiledMethod typAsFunctionTypeWithResult: BlKeyboardKey typAsType
]
