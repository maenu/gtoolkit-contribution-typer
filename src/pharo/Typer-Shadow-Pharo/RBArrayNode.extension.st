Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBArrayNode >> typShaMethodStatements: aLookup [
	<typShaMethod: 'statements'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]
