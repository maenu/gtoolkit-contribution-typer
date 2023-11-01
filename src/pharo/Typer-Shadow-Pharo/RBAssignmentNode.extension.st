Extension { #name : #RBAssignmentNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBAssignmentNode >> typShaMethodUnaryValue: aLookup root: anotherLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
RBAssignmentNode >> typShaMethodUnaryVariable: aLookup root: anotherLookup [
	<typShaMethod: 'variable'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBVariableNode typAsType
]
