Extension { #name : #RBBlockNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBBlockNode >> typShaMethodUnaryArguments: aLookup root: anotherLookup [
	<typShaMethod: 'arguments'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBArgumentNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBBlockNode >> typShaMethodUnaryBody: aLookup root: anotherLookup [
	<typShaMethod: 'body'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBSequenceNode typAsType
]
