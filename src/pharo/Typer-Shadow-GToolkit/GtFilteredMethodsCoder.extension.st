Extension { #name : #GtFilteredMethodsCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtFilteredMethodsCoder >> typShaMethodKeywordMethodAdded: aLookup [
	<typShaMethod: 'methodAdded:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {ValueAdded typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtFilteredMethodsCoder >> typShaMethodKeywordNewMethodCoderFor: aLookup [
	<typShaMethod: 'newMethodCoderFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoMethodCoder typAsType
		arguments: {CompiledMethod typAsType}
]
