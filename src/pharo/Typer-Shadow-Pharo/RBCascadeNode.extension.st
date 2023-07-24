Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBCascadeNode >> typShaMethodMessages: aLookup [
	<typShaMethod: 'messages'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBMessageNode typAsType})
]
