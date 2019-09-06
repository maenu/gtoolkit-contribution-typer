Class {
	#name : #TypInfTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfTypeResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypTypeLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ {aLookup receiverType asClass typInfAsTypeResolver} ]
		ifFalse: [ #() ]
]
