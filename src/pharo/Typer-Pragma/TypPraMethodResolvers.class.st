Class {
	#name : #TypPraMethodResolvers,
	#superclass : #TypPraResolvers,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraMethodResolvers >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #initialization }
TypPraMethodResolvers >> selector [
	^ #typPraMethodResolverIndex
]
