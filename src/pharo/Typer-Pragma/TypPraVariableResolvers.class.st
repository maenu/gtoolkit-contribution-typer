Class {
	#name : #TypPraVariableResolvers,
	#superclass : #TypCachingResolvers,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraVariableResolvers >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #initialization }
TypPraVariableResolvers >> invalidate [
	cache := ((Smalltalk allClasses
		flatCollect: [ :e | 
			{e.
			e class} ]) flatCollect: #typPraVariableResolverIndex) asDictionary
]

{ #category : #initialization }
TypPraVariableResolvers >> selector [
	^ #typPraVariableResolverIndex
]
