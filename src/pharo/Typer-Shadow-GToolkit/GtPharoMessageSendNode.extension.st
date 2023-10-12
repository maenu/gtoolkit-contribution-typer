Extension { #name : #GtPharoMessageSendNode }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMessageSendNode >> typShaMethodUnaryReceiver: aLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPharoValueNode typAsType
]
