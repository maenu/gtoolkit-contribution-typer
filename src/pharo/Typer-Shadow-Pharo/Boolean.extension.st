Extension { #name : #Boolean }

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodAnd: aLookup [
	<typShaMethod: 'and:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Boolean typAsType.
					BlockClosure typAsFunctionTypeWithResult: Boolean typAsType} typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodNot: aLookup [
	<typShaMethod: 'not'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #'*Typer-Shadow-Pharo' }
Boolean >> typShaMethodOr: aLookup [
	<typShaMethod: 'or:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {{Boolean typAsType.
					BlockClosure typAsFunctionTypeWithResult: Boolean typAsType} typAsType}
]
