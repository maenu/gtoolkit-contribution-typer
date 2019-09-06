Class {
	#name : #TypPraMethodResolver,
	#superclass : #TypResolver,
	#category : #'Typer-Pragma'
}

{ #category : #accessing }
TypPraMethodResolver >> resolversFor: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypIterator<TypResolver<TypMethodLookup>>'>
	^ aLookup receiverType representsClass
		ifTrue: [ {(aLookup receiverType asClass
				typPraAsMethodResolverFor: aLookup selector)} typAsIterator ]
		ifFalse: [ #() typAsIterator ]
]
