Class {
	#name : #TypShaGtGtPrefixTree,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPrefixTree class >> shadowedClass [
	^ GtPrefixTree class
]

{ #category : #shadow }
TypShaGtGtPrefixTree >> mAddWeight: aLookup [
	<typShaMethod: 'add:weight:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: '@self' typAsVariableType
		arguments:
			{String typAsType.
			Number typAsType}
]

{ #category : #shadow }
TypShaGtGtPrefixTree >> mWeightedFirstStartingWith: aLookup [
	<typShaMethod: 'weightedFirst:startingWith:'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {String typAsType})
		arguments:
			{Integer typAsType.
			String typAsType}
]
