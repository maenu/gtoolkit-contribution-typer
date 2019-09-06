Class {
	#name : #TypPraTypeResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraTypeResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypIterator<TypResolver<TypTypeLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ {aLookup receiverType asClass typPraAsTypeResolver} typAsIterator ]
		ifFalse: [ #() typAsIterator ]
]
