Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBBlockNode >> typShaMethodArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBArgumentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBBlockNode >> typShaMethodBody: aLookup [
	<typShaMethod: 'body'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBSequenceNode typAsType
]
