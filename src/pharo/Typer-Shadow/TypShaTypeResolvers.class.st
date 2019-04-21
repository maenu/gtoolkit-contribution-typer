Class {
	#name : #TypShaTypeResolvers,
	#superclass : #TypCachingResolvers,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaTypeResolvers >> cachedResolversFor: aLookup [
	^ cache at: aLookup clazz name ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaTypeResolvers >> selector [
	^ #typShaTypeResolverIndex
]
