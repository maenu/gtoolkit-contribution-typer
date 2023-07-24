Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBAssignmentNode >> typShaMethodValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBAssignmentNode >> typShaMethodVariable: aLookup [
	<typShaMethod: 'variable'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBVariableNode typAsType
]
