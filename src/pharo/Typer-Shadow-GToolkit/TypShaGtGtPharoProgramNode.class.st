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
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ String typAsType ]
				ifFalse: [ i = 2
						ifTrue: [ String typAsType ]
						ifFalse: [ Integer typAsType ] ] ];
		resultType: [ :a :s :r | GtCompletionAction typAsType ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPharoProgramNode >> mCompletionActionsFor: aLookup [ 
	<typShaMethod: 'completionActionsFor:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | GtPharoCompletionStrategy typAsType ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {GtCompletionAction typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaGtGtPharoProgramNode >> mSource: aLookup [
	<typShaMethod: 'source'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
