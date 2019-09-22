Class {
	#name : #TypLookupResolver,
	#superclass : #Object,
	#classInstVars : [
		'empty'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypLookupResolver >> initialize [
	<typTypeParametersAs: 'TypLookup'>
	super initialize
]

{ #category : #initialization }
TypLookupResolver >> reset [
	
]

{ #category : #accessing }
TypLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypLookupResult>'>
	self subclassResponsibility
]
