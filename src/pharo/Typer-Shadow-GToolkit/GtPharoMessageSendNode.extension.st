Extension { #name : #GtPharoMessageSendNode }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMessageSendNode >> typShaMethodReceiver: aLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPharoValueNode typAsType
]
