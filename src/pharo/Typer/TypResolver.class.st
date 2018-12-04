Class {
	#name : #TypResolver,
	#superclass : #Object,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypLookup>>'>
	^ {self}
]

{ #category : #accessing }
TypResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypLookup'>
	<typTypeResultAs: 'Boolean'>
	^ false
]
