Class {
	#name : #TypInfVariableResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfVariableResolver >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfVariableResolver >> selector [
	^ #typInfVariableResolverIndex
]
