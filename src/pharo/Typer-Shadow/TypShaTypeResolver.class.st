Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Shadow'
}

{ #category : #accessing }
TypShaTypeResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypTypeLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ aLookup receiverType asClass typShaShadows
				collect: [ :e | e asTypeResolver ] ]
		ifFalse: [ #() ]
]
