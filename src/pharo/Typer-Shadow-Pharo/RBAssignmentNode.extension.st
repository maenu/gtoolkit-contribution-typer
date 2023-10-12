Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBAssignmentNode >> typShaMethodUnaryValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBAssignmentNode >> typShaMethodUnaryVariable: aLookup [
	<typShaMethod: 'variable'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBVariableNode typAsType
]
