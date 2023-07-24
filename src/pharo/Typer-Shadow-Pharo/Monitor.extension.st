Extension { #name : #Monitor }

{ #category : #'*Typer-Shadow-Pharo' }
Monitor >> typShaMethodCritical: aLookup [
	<typShaMethod: 'critical:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (aLookup arguments at: 1) result
		arguments: {BlockClosure typAsType}
]
