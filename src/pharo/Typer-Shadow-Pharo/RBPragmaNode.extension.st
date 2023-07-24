Extension { #name : #RBPragmaNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBPragmaNode >> typShaMethodSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBPragmaNode class >> typShaMethodSelectorArguments: aLookup [
	<typShaMethod: 'selector:arguments:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBPragmaNode typAsType
		arguments: {Symbol typAsType.
				SequenceableCollection typAsType
					withParameters: {RBLiteralValueNode typAsType}}
]
