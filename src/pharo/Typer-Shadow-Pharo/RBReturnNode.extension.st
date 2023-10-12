Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBReturnNode >> typShaMethodUnaryValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]
