Class {
	#name : #TypInfClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: '!TypClassResolver<TypClassLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typInfAsClassResolver
				resolve: aLookup ]
		ifFalse: [ nil ]
]
