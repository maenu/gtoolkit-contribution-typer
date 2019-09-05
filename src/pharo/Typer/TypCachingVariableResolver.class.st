Class {
	#name : #TypCachingVariableResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypCachingVariableResolver >> resolversFor: aLookup [
	aLookup receiverType representsClass
		ifFalse: [ ^ #() typAsIterator ].
	^ cache
		at: aLookup receiverType asClass name asSymbol
		ifPresent: [ :e | 
			e
				at: aLookup selector asSymbol
				ifPresent: [ :f | f resolversFor: aLookup ]
				ifAbsent: [ #() typAsIterator ] ]
		ifAbsent: [ #() typAsIterator ]
]
