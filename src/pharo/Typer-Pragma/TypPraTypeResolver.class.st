Class {
	#name : #TypPraTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraTypeResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'SequenceableCollection<TypResolver<TypTypeLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ {aLookup receiverType asClass typPraAsTypeResolver} ]
		ifFalse: [ #() ]
]
