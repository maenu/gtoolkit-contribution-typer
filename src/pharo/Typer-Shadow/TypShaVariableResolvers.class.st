Class {
	#name : #TypShaVariableResolvers,
	#superclass : #TypCachingResolvers,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaVariableResolvers >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaVariableResolvers >> selector [
	^ #typShaVariableResolverIndex
]
