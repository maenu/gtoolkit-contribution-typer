Class {
	#name : #TypInfVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #'as yet unclassified' }
TypInfVariableLookupResolver >> assignedTypeIn: aClassDecription at: aSymbol in: aCollection [
	self flag: 'TODO might this affect the ast typing in other stacks?'.
	^ (aCollection
		flatCollect: [ :f | 
			f assignmentNodes
				select: [ :h | h variable name = aSymbol ]
				thenCollect: [ :h | h value typType ] ]) typAsType
]

{ #category : #accessing }
TypInfVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	| classDescription selector |
	aLookup push: self.
	aLookup receiverType isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiverType hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	classDescription := aLookup receiverType classDescription.
	selector := aLookup selector.
	(classDescription allInstVarNames includes: selector)
		ifTrue: [ ^ {(self
				assignedTypeIn: classDescription
				at: selector
				in: classDescription allMethods)} ].
	((classDescription allClassVariables collect: #key)
		includes: selector)
		ifTrue: [ self flag: '...or we just take the type of the value?'.
			^ {(self
				assignedTypeIn: classDescription
				at: selector
				in: classDescription allMethods , classDescription class allMethods)} ].
	TypNoTypeError signal
]
