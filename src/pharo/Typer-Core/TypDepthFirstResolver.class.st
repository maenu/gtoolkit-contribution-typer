Class {
	#name : #TypDepthFirstResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #'as yet unclassified' }
TypDepthFirstResolver class >> resolver: aResolver [

	^ self new
		  initializeResolver: aResolver;
		  yourself
]

{ #category : #resolving }
TypDepthFirstResolver >> canResolve: aLookup [
	(resolver canResolve: aLookup) ifTrue: [ ^ true ].
	^ aLookup hasParent and: [ self canResolve: aLookup asParent ]
]

{ #category : #initialization }
TypDepthFirstResolver >> initializeResolver: aResolver [
	resolver := aResolver
]

{ #category : #accessing }
TypDepthFirstResolver >> printOn: aStream [

	aStream nextPutAll: '↓'.
	resolver printOn: aStream
]

{ #category : #resolving }
TypDepthFirstResolver >> resolve: aLookup [
	| resolved |
	(resolver canResolve: aLookup) ifTrue: [ ^ resolver resolve: aLookup ].
	resolved := self resolve: aLookup asParent.
	aLookup resolved: resolved resolver: resolved resolver.
	^ resolved
]
