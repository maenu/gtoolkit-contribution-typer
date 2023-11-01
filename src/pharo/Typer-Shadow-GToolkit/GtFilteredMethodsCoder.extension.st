Extension { #name : #GtFilteredMethodsCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtFilteredMethodsCoder >> typShaMethodKeywordMethodAdded: aLookup root: anotherLookup [
	<typShaMethod: 'methodAdded:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {ValueAdded typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtFilteredMethodsCoder >> typShaMethodKeywordNewMethodCoderFor: aLookup root: anotherLookup [
	<typShaMethod: 'newMethodCoderFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoMethodCoder typAsType
		arguments: {CompiledMethod typAsType}
]
