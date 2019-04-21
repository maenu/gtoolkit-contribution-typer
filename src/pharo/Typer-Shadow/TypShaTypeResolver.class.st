Class {
	#name : #TypShaTypeResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaTypeResolver >> cachedResolversFor: aLookup [
	^ cache at: aLookup clazz name ifAbsent: [ #() ]
]

{ #category : #accessing }
TypShaTypeResolver >> selector [
	^ #typShaTypeResolverIndex
]
