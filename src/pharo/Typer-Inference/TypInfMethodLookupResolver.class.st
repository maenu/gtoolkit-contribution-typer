Class {
	#name : #TypInfMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	| classDescription selector  |
	aLookup push: self.
	aLookup receiverType isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiverType hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	classDescription := aLookup receiverType classDescription.
	selector := aLookup selector.
	^ {(classDescription lookupSelector: selector) typInfType}
]
