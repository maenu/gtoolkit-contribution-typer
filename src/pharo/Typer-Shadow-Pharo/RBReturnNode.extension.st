Extension { #name : #RBReturnNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBReturnNode >> typShaMethodUnaryValue: aLookup root: anotherLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]
