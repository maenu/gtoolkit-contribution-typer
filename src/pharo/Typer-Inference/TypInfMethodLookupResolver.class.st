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
	aLookup receiver isNamed
		ifFalse: [ TypNoTypeError signal ].
	aLookup receiver hasClassDescription
		ifFalse: [ TypNoTypeError signal ].
	classDescription := aLookup receiver classDescription.
	selector := aLookup selector.
	^ {(classDescription lookupSelector: selector) typInfType}
]
