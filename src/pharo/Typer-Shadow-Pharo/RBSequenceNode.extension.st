Extension { #name : #RBSequenceNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBSequenceNode >> typShaMethodUnaryStatements: aLookup root: anotherLookup [
	<typShaMethod: 'statements'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBProgramNode typAsType})
]

{ #category : #'*Typer-Shadow-Pharo' }
RBSequenceNode >> typShaMethodUnaryTemporaries: aLookup root: anotherLookup [
	<typShaMethod: 'temporaries'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {RBTemporaryNode typAsType})
]
