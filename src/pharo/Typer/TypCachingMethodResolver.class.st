Class {
	#name : #TypCachingMethodResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypCachingMethodResolver >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name asSymbol
		ifPresent: [ :e | e at: aLookup selector asSymbol ifAbsent: [ #() ] ]
		ifAbsent: [ #() ]
]
