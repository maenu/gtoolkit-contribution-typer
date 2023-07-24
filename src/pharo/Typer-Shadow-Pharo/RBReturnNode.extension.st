Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBReturnNode >> typShaMethodValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]
