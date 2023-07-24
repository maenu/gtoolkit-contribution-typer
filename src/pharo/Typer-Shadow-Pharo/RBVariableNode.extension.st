Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodBinding: aLookup [
	<typShaMethod: 'binding'>
	^ CompiledMethod typAsFunctionTypeWithResult: OCLiteralVariable typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodIsInstance: aLookup [
	<typShaMethod: 'isInstance'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodName: aLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
