Class {
	#name : #TypResolver,
	#superclass : #Object,
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypResolver >> initialize [
	<typTypeParametersAs: 'TypLookup'>
	super initialize
]

{ #category : #accessing }
TypResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'TypIterator<TypResolver<TypLookup>>'>
	^ {self} typAsIterator
]
