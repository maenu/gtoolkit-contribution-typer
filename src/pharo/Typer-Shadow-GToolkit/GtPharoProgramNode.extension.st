Extension { #name : #GtPharoProgramNode }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoProgramNode >> typShaMethodKeywordActionForSelectorStartingWithAt: aLookup root: anotherLookup [
	<typShaMethod: 'actionForSelector:startingWith:at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCompletionAction typAsType
		arguments: {String typAsType.
				String typAsType.
				Integer typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoProgramNode >> typShaMethodKeywordCompletionActionsFor: aLookup root: anotherLookup [
	<typShaMethod: 'completionActionsFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {GtCompletionAction typAsType})
		arguments: {GtPharoCompletionStrategy typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPharoProgramNode >> typShaMethodUnarySource: aLookup root: anotherLookup [
	<typShaMethod: 'source'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
