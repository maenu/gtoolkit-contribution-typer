Class {
	#name : #TypPraTypeResolvers,
	#superclass : #TypCachingResolvers,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraTypeResolvers >> cachedResolversFor: aLookup [
	^ cache at: aLookup clazz name ifAbsent: [ #() ]
]

{ #category : #initialization }
TypPraTypeResolvers >> selector [
	^ #typPraTypeResolverIndex
]
