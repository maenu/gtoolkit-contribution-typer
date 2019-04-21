Class {
	#name : #TypInfTypeResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfTypeResolver >> cachedResolversFor: aLookup [
	^ cache at: aLookup clazz name ifAbsent: [ #() ]
]

{ #category : #accessing }
TypInfTypeResolver >> selector [
	^ #typInfTypeResolverIndex
]
