Extension { #name : #Context }

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod typAsFunctionTypeWithResult: SequenceableCollection typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodMethod: aLookup [
	<typShaMethod: 'method'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodReceiver: aLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: Object typAsType
]
