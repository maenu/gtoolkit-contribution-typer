Class {
	#name : #TypInfMethodResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfMethodResolver >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfMethodResolver >> selector [
	^ #typInfMethodResolverIndex
]
