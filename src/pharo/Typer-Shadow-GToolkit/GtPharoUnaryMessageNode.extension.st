Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoUnaryMessageNode >> typShaMethodParent: aLookup [
	<typShaMethod: 'parent'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPharoMessageSendNode typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoUnaryMessageNode >> typShaMethodSelectorPart: aLookup [
	<typShaMethod: 'selectorPart'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmaCCToken typAsType
]
