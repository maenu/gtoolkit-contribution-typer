Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBBlockNode >> typShaMethodUnaryArguments: aLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBArgumentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBBlockNode >> typShaMethodUnaryBody: aLookup [
	<typShaMethod: 'body'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBSequenceNode typAsType
]
