Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfMethodResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ {(aLookup receiverType asClass
				typInfAsMethodResolverFor: aLookup selector)} ]
		ifFalse: [ #() ]
]
