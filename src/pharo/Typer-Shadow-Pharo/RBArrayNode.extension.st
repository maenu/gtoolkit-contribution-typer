Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBArrayNode >> typShaMethodUnaryStatements: aLookup [
	<typShaMethod: 'statements'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]
