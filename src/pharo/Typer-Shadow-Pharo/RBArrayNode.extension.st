Extension { #name : #RBArrayNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBArrayNode >> typShaMethodUnaryStatements: aLookup root: anotherLookup [
	<typShaMethod: 'statements'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]
