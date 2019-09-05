Class {
	#name : #TypCachingTypeResolver,
	#superclass : #TypCachingResolver,
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypCachingTypeResolver >> resolversFor: aLookup [
	^ cache
		at: aLookup clazz name asSymbol
		ifPresent: [ :f | f resolversFor: aLookup ]
		ifAbsent: [ #() typAsIterator ]
]
