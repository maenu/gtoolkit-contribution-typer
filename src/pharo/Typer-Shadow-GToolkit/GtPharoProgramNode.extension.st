Extension { #name : #GtPharoProgramNode }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoProgramNode >> typShaMethodKeywordActionForSelectorStartingWithAt: aLookup [
	<typShaMethod: 'actionForSelector:startingWith:at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCompletionAction typAsType
		arguments: {String typAsType.
				String typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoProgramNode >> typShaMethodKeywordCompletionActionsFor: aLookup [
	<typShaMethod: 'completionActionsFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {GtCompletionAction typAsType})
		arguments: {GtPharoCompletionStrategy typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoProgramNode >> typShaMethodUnarySource: aLookup [
	<typShaMethod: 'source'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
