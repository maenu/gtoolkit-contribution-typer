Extension { #name : #GtPharoCompletionStrategy }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoCompletionStrategy >> typShaMethodActionsForAt: aLookup [
	<typShaMethod: 'actionsFor:at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {GtCompletionAction typAsType})
		arguments: {GtPharoMethodNode typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoCompletionStrategy >> typShaMethodClassOrMetaClass: aLookup [
	<typShaMethod: 'classOrMetaClass:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {ClassDescription typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoCompletionStrategy >> typShaMethodIndex: aLookup [
	<typShaMethod: 'index'>
	^ CompiledMethod typAsFunctionTypeWithResult: Integer typAsType
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoCompletionStrategy >> typShaMethodNodeForIn: aLookup [
	<typShaMethod: 'nodeFor:in:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtPharoProgramNode typAsType asNullable
		arguments: {Integer typAsType.
				GtPharoMethodNode typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoCompletionStrategy >> typShaMethodSelectorsForReceiverMatching: aLookup [
	<typShaMethod: 'selectorsForReceiver:matching:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
		arguments: {Behavior typAsType.
				String typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoCompletionStrategy >> typShaVariableMaxItems: aLookup [
	<typShaVariable: #maxItems>
	^ Integer typAsType
]
