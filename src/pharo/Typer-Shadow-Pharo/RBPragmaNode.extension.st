Extension { #name : #RBPragmaNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBPragmaNode class >> typShaMethodKeywordSelectorArguments: aLookup [
	<typShaMethod: 'selector:arguments:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBPragmaNode typAsType
		arguments: {Symbol typAsType.
				SequenceableCollection typAsType
					withParameters: {RBLiteralValueNode typAsType}}
]

{ #category : #'*Typer-Shadow-Pharo' }
RBPragmaNode >> typShaMethodUnarySelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
