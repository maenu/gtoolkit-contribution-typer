Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoUnaryMessageNode >> typShaMethodUnaryParent: aLookup [
	<typShaMethod: 'parent'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPharoMessageSendNode typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoUnaryMessageNode >> typShaMethodUnarySelectorPart: aLookup [
	<typShaMethod: 'selectorPart'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmaCCToken typAsType
]
