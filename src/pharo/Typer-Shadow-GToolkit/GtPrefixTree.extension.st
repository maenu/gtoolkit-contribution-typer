Extension { #name : #GtPrefixTree }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPrefixTree >> typShaMethodKeywordAddWeight: aLookup root: anotherLookup [
	<typShaMethod: 'add:weight:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup self
		arguments: {String typAsType.
				Number typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPrefixTree >> typShaMethodKeywordWeightedFirstStartingWith: aLookup root: anotherLookup [
	<typShaMethod: 'weightedFirst:startingWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
		arguments: {Integer typAsType.
				String typAsType}
]
