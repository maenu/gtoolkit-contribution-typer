Class {
	#name : #TypInfVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypIterator<TypResolver<TypVariableLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ {(aLookup receiverType asClass
				typInfAsVariableResolverFor: aLookup selector)} typAsIterator ]
		ifFalse: [ #() typAsIterator ]
]
