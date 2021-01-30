Class {
	#name : #TypDepthLookupResolver,
	#superclass : #TypLookupResolver,
	#instVars : [
		'resolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypDepthLookupResolver >> initialize [
	<typTypeVariable: 'resolver' as: 'TypLookupResolver'>
	super initialize
]

{ #category : #initialization }
TypDepthLookupResolver >> reset [
	resolver reset
]

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

{ #category : #accessing }
TypDepthLookupResolver >> resolver [
	^ resolver
]

{ #category : #accessing }
TypDepthLookupResolver >> resolver: anObject [
	resolver := anObject
]
