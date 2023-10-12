Extension { #name : #Context }

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodUnaryArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod typAsFunctionTypeWithResult: SequenceableCollection typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodUnaryMethod: aLookup [
	<typShaMethod: 'method'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodUnaryReceiver: aLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: Object typAsType
]
