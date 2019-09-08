Class {
	#name : #TypPraVariableLookupResolver,
	#superclass : #TypLookupResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraVariableLookupResolver >> resolve: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: '!TypVariableResolver<TypVariableLookup>'>
	^ aLookup receiverType representsClass
		ifTrue: [ (aLookup receiverType asClass
				typPraAsVariableResolverFor: aLookup selector)
				resolve: aLookup ]
		ifFalse: [ nil ]
]
