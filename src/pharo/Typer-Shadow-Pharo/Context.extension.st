Extension { #name : #Context }

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodUnaryArguments: aLookup root: anotherLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod typAsFunctionTypeWithResult: SequenceableCollection typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodUnaryMethod: aLookup root: anotherLookup [
	<typShaMethod: 'method'>
	^ CompiledMethod typAsFunctionTypeWithResult: CompiledMethod typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Context >> typShaMethodUnaryReceiver: aLookup root: anotherLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: Object typAsType
]
