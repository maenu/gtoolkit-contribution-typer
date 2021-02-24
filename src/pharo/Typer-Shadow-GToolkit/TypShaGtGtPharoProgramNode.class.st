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
	<typMigrated>
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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {GtCompletionAction typAsType})
		arguments: {GtPharoCompletionStrategy typAsType}
]

{ #category : #shadow }
TypShaGtGtPharoProgramNode >> mSource: aLookup [
	<typShaMethod: 'source'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
