Extension { #name : #GtPharoMessageSendNode }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoMessageSendNode >> typShaMethodUnaryReceiver: aLookup root: anotherLookup [
	<typShaMethod: 'receiver'>
	^ CompiledMethod typAsFunctionTypeWithResult: GtPharoValueNode typAsType
]
