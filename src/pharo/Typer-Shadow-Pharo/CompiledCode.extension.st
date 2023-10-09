Extension { #name : #CompiledCode }

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMetObjectAt: aLookup [
	<typShaMethod: 'objectAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMetObjectAtPut: aLookup [
	<typShaMethod: 'objectAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMethodIsPrimitive: aLookup [
	<typShaMethod: 'isPrimitive'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
