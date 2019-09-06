Class {
	#name : #TypInfVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfVariableResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypVariableLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ {(aLookup receiverType asClass
				typInfAsVariableResolverFor: aLookup selector)} ]
		ifFalse: [ #() ]
]
