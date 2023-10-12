Extension { #name : #Character }

{ #category : #'*Typer-Shadow-Pharo' }
Character class >> typShaMethodKeywordValue: aLookup [
	<typShaMethod: 'value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Character >> typShaMethodUnaryIsUppercase: aLookup [
	<typShaMethod: 'isUppercase'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
