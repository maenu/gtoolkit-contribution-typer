Extension { #name : #CompiledCode }

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMethodKeywordObjectAt: aLookup root: anotherLookup [
	<typShaMethod: 'objectAt:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMethodKeywordObjectAtPut: aLookup root: anotherLookup [
	<typShaMethod: 'objectAt:put:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: TypUnknownType instance
		arguments: {Integer typAsType.
				TypUnknownType instance}
]

{ #category : #'*Typer-Shadow-Pharo' }
CompiledCode >> typShaMethodUnaryIsPrimitive: aLookup root: anotherLookup [
	<typShaMethod: 'isPrimitive'>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]
