Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodUnaryBinding: aLookup [
	<typShaMethod: 'binding'>
	^ CompiledMethod typAsFunctionTypeWithResult: OCLiteralVariable typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodUnaryIsInstance: aLookup [
	<typShaMethod: 'isInstance'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodUnaryName: aLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
