Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthLookupResolver >> resolve: aLookup [
	| results |
	aLookup push: self.
	results := (resolver resolve: aLookup) asOrderedCollection.
	aLookup hasSuperType
		ifTrue: [ results addAll: (self resolve: aLookup copyWithSuperType) ].
	^ results
]
