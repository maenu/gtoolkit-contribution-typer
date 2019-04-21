Class {
	#name : #TypPraMethodResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraMethodResolver >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #initialization }
TypPraMethodResolver >> selector [
	^ #typPraMethodResolverIndex
]
