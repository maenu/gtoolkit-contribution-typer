Class {
	#name : #TypPraClassLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraClassLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypClassLookup'>
	<typTypeResultAs: '!TypClassResolver<TypClassLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typPraAsClassResolver
				resolve: aLookup ]
		ifFalse: [ nil ]
]
