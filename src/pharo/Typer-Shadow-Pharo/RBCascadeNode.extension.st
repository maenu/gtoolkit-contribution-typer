Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBCascadeNode >> typShaMethodUnaryMessages: aLookup [
	<typShaMethod: 'messages'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBMessageNode typAsType})
]
