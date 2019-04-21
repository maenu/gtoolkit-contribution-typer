Class {
	#name : #TypPraTypeResolvers,
	#superclass : #TypPraResolvers,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraTypeResolvers >> cachedResolversFor: aLookup [
	aLookup clazz
		ifFalse: [ ^ #() ].
	^ cache at: aLookup clazz name
]

{ #category : #initialization }
TypPraTypeResolvers >> selector [
	^ #typPraTypeResolverIndex
]
