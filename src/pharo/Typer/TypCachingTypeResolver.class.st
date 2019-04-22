Class {
	#name : #TypCachingTypeResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypCachingTypeResolver >> cachedResolversFor: aLookup [
	^ cache at: aLookup clazz name asSymbol ifAbsent: [ #() ]
]
