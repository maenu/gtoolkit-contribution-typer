Class {
	#name : #TypLookupResolver,
	#superclass : #Object,
	#classInstVars : [
		'empty'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypLookupResolver class >> empty [
	^ empty
		ifNil: [ empty := self new
				precondition: [ false ];
				yourself ]
]

{ #category : #initialization }
TypLookupResolver >> initialize [
	<typTypeParametersAs: 'TypLookup'>
	super initialize
]

{ #category : #accessing }
TypLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: '!TypLookupResult'>
	self subclassResponsibility
]
