Extension { #name : #RBCascadeNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBCascadeNode >> typShaMethodUnaryMessages: aLookup root: anotherLookup [
	<typShaMethod: 'messages'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBMessageNode typAsType})
]
