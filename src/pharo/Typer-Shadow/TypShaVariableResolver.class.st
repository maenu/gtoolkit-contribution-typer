Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaVariableResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypVariableLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typShaShadows
				collect: [ :e | e asVariableResolverFor: aLookup selector ] ]
		ifFalse: [ #() ]
]
