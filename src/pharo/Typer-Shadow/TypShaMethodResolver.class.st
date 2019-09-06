Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaMethodResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypMethodLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typShaShadows
				collect: [ :e | e asMethodResolverFor: aLookup selector ] ]
		ifFalse: [ #() ]
]
