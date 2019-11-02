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
	results := OrderedCollection new.
	results addAll: (resolver resolve: aLookup).
	aLookup hasSuperType
		ifTrue: [ results
				addAll:
					((self resolve: aLookup copy adaptWithSuperType)
						do: [ :e | e lookup: aLookup ]) ].
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
