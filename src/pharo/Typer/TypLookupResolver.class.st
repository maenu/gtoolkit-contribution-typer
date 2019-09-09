Class {
	#name : #TypLookupResolver,
	#superclass : #Object,
	#classInstVars : [
		'empty'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypLookupResolver >> initialize [
	<typTypeParametersAs: 'TypLookup'>
	super initialize
]

{ #category : #accessing }
TypLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypLookupResult>'>
	self subclassResponsibility
]
