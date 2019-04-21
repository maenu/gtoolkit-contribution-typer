Class {
	#name : #TypShaMethodResolvers,
	#superclass : #TypCachingResolvers,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaMethodResolvers >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaMethodResolvers >> selector [
	^ #typShaMethodResolverIndex
]
