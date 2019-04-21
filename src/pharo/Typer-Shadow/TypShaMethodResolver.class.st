Class {
	#name : #TypShaMethodResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaMethodResolver >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaMethodResolver >> selector [
	^ #typShaMethodResolverIndex
]
