Class {
	#name : #TypResolver,
	#superclass : #Object,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypResolver >> resolverFor: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'TypResolver<TypLookup>'>
	^ self
]

{ #category : #accessing }
TypResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'Boolean'>
	^ false
]
