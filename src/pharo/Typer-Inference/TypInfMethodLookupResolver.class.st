Class {
	#name : #TypInfMethodLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: '!TypMethodResolver<TypMethodLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ (aLookup receiverType asClass
				typInfAsMethodResolverFor: aLookup selector) resolve: aLookup ]
		ifFalse: [ nil ]
]
