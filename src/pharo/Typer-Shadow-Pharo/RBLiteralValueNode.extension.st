Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBLiteralValueNode class >> typShaMethodValue: aLookup [
	<typShaMethod: 'value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {{Number typAsType.
					String typAsType} typAsType}
]
