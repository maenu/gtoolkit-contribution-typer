Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBSequenceNode >> typShaMethodStatements: aLookup [
	<typShaMethod: 'statements'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBSequenceNode >> typShaMethodTemporaries: aLookup [
	<typShaMethod: 'temporaries'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBTemporaryNode typAsType})
]
