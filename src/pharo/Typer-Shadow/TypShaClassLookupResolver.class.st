Class {
	#name : #TypShaClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: '!TypClassLookupResult'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typShaShadows
				ifEmpty: [ nil ]
				ifNotEmpty: [ :f | f first asClassLookupResult ] ]
		ifFalse: [ nil ]
]
