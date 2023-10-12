Extension { #name : #CompiledCode }

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMethodKeywordObjectAt: aLookup [
	<typShaMethod: 'objectAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMethodKeywordObjectAtPut: aLookup [
	<typShaMethod: 'objectAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMethodUnaryIsPrimitive: aLookup [
	<typShaMethod: 'isPrimitive'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
