Extension { #name : #GtPrefixTree }

{ #category : #'*Typer-Shadow-GToolkit' }
GtPrefixTree >> typShaMethodAddWeight: aLookup [
	<typShaMethod: 'add:weight:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: aLookup root receiver
		arguments: {String typAsType.
				Number typAsType}
]

{ #category : #'*Typer-Shadow-GToolkit' }
GtPrefixTree >> typShaMethodWeightedFirstStartingWith: aLookup [
	<typShaMethod: 'weightedFirst:startingWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: (SequenceableCollection typAsType withParameters: {String typAsType})
		arguments: {Integer typAsType.
				String typAsType}
]
