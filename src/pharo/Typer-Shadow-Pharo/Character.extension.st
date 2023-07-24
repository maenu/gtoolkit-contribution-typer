Extension { #name : #Character }

{ #category : #'*Typer-Shadow-Pharo' }
Character >> typShaMethodIsUppercase: aLookup [
	<typShaMethod: 'isUppercase'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Character class >> typShaMethodValue: aLookup [
	<typShaMethod: 'value:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup receiver classDescription instanceSide typAsType
		arguments: {Integer typAsType}
]
