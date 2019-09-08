Class {
	#name : #TypShaMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: '!TypMethodLookupResult'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typShaShadows
				ifEmpty: [ nil ]
				ifNotEmpty: [ :f | f first asMethodLookupResultFor: aLookup selector ] ]
		ifFalse: [ nil ]
]
