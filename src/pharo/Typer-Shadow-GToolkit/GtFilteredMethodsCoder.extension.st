Extension { #name : #GtFilteredMethodsCoder }

{ #category : #'*Typer-Shadow-GToolkit' }
GtFilteredMethodsCoder >> typShaMethodMethodAdded: aLookup [
	<typShaMethod: 'methodAdded:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {ValueAdded typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtFilteredMethodsCoder >> typShaMethodNewMethodCoderFor: aLookup [
	<typShaMethod: 'newMethodCoderFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoMethodCoder typAsType
		arguments: {CompiledMethod typAsType}
]
