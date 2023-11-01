Extension { #name : #RBLiteralValueNode }

{ #category : #'*Typer-Shadow-Pharo' }
RBLiteralValueNode class >> typShaMethodKeywordValue: aLookup root: anotherLookup [
	<typShaMethod: 'value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {{Number typAsType.
					String typAsType} typAsType}
]
