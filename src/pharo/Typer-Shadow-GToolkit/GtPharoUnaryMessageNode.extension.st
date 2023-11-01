Extension { #name : #GtPharoUnaryMessageNode }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoUnaryMessageNode >> typShaMethodUnaryParent: aLookup root: anotherLookup [
	<typShaMethod: 'parent'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPharoMessageSendNode typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoUnaryMessageNode >> typShaMethodUnarySelectorPart: aLookup root: anotherLookup [
	<typShaMethod: 'selectorPart'>
	^ CompiledMethod typAsFunctionTypeWithResult: SmaCCToken typAsType
]
