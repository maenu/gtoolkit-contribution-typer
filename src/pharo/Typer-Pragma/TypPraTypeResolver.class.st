Class {
	#name : #TypPraTypeResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraTypeResolver >> cachedResolversFor: aLookup [
	^ cache at: aLookup clazz name ifAbsent: [ #() ]
]

{ #category : #initialization }
TypPraTypeResolver >> selector [
	^ #typPraTypeResolverIndex
]
