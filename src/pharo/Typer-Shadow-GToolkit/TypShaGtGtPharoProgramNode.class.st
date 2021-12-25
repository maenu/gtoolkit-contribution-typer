Class {
	#name : #TypShaGtGtPharoProgramNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-GToolkit'
}

{ #category : #'as yet unclassified' }
TypShaGtGtPharoProgramNode class >> shadowedClass [
	^ GtPharoProgramNode class
]

{ #category : #shadow }
TypShaGtGtPharoProgramNode >> mActionForSelectorStartingWithAt: aLookup [
	<typShaMethod: 'actionForSelector:startingWith:at:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: GtCompletionAction typAsType
		arguments:
			{String typAsType.
			String typAsType.
			Integer typAsType}
]

{ #category : #shadow }
TypShaGtGtPharoProgramNode >> mCompletionActionsFor: aLookup [
	<typShaMethod: 'completionActionsFor:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				withParameters: {GtCompletionAction typAsType})
		arguments: {GtPharoCompletionStrategy typAsType}
]

{ #category : #shadow }
TypShaGtGtPharoProgramNode >> mSource: aLookup [
	<typShaMethod: 'source'>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
