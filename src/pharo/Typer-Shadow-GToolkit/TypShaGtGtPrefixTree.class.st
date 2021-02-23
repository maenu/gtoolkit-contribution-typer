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
		typAsFunctionTypeWithResult: aLookup receiverType
		arguments:
			{String typAsType.
			Number typAsType}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaGtGtPrefixTree >> mWeightedFirstStartingWith: aLookup [
	<typShaMethod: 'weightedFirst:startingWith:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {String typAsType})
		arguments:
			{Integer typAsType.
			String typAsType}
		argumentsOptional: false
		signalsAlways: false
]
