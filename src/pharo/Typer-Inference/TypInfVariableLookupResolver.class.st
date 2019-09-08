Class {
	#name : #TypInfVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: '!TypVariableResolver<TypVariableLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ (aLookup receiverType asClass
				typInfAsVariableResolverFor: aLookup selector)
				resolve: aLookup ]
		ifFalse: [ nil ]
]
