Class {
	#name : #TypPraVariableResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Pragma-Core'
}

{ #category : #accessing }
TypPraVariableResolver >> cachedResolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() ].
	^ cache
		at: aLookup receiverType asClass name -> aLookup selector
		ifAbsent: [ #() ]
]

{ #category : #initialization }
TypPraVariableResolver >> invalidate [
	cache := ((Smalltalk allClasses
		flatCollect: [ :e | 
			{e.
			e class} ]) flatCollect: #typPraVariableResolverIndex) asDictionary
]

{ #category : #initialization }
TypPraVariableResolver >> selector [
	^ #typPraVariableResolverIndex
]
