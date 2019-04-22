Class {
	#name : #TypCachingVariableResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypCachingVariableResolver >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name asSymbol
		ifPresent: [ :e | e at: aLookup selector asSymbol ifAbsent: [ #() ] ]
		ifAbsent: [ #() ]
]
