Extension { #name : #RBVariableNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodUnaryBinding: aLookup root: anotherLookup [
	<typShaMethod: 'binding'>
	^ CompiledMethod typAsFunctionTypeWithResult: OCLiteralVariable typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodUnaryIsInstance: aLookup root: anotherLookup [
	<typShaMethod: 'isInstance'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBVariableNode >> typShaMethodUnaryName: aLookup root: anotherLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
