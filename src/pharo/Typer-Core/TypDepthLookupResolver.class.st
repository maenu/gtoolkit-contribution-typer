Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypWrappingLookupResolver,
	#category : #'Typer-Core-Lookup'
}

{ #category : #resolving }
TypDepthLookupResolver >> resolve: aLookup [
	| results |
	aLookup push: self.
	results := OrderedCollection withAll: (resolver resolve: aLookup).
	aLookup hasSuperType
		ifTrue:
			[ results addAll: (self resolve: aLookup copyWithSuperType) ].
	^ results
]
