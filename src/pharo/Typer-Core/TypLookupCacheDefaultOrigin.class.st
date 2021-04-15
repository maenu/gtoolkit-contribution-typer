Class {
	#name : #TypLookupCacheDefaultOrigin,
	#superclass : #TypLookupOrigin,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypLookupCacheDefaultOrigin >> printOn: aStream [
	aStream nextPutAll: 'cache default, '.
	super printOn: aStream
]
