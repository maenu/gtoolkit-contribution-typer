Class {
	#name : #TypShaVariableResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaVariableResolver >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaVariableResolver >> selector [
	^ #typShaVariableResolverIndex
]
