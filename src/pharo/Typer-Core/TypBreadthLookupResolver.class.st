Class {
	#name : #TypBreadthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypBreadthLookupResolver >> resolve: aLookup [
	| results |
	self flag: 'TODO'.
	aLookup push: self.
	aLookup asCollection.
	results := OrderedCollection withAll: (resolver resolve: aLookup).
	aLookup hasSuperType
		ifTrue: [ results addAll: (self resolve: aLookup copyWithSuperType) ].
	^ results
]
