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

{ #category : #resolving }
TypDepthFirstResolver >> preResolve: aLookup root: anotherLookup [
	(resolver canResolve: aLookup)
		ifTrue: [ ^ resolver preResolve: aLookup root: anotherLookup ].
	^ self preResolve: aLookup asParent root: anotherLookup
]

{ #category : #accessing }
TypDepthFirstResolver >> printOn: aStream [

	aStream nextPutAll: '↓'.
	resolver printOn: aStream
]

{ #category : #resolving }
TypDepthFirstResolver >> resolve: aLookup root: anotherLookup [
	(resolver canResolve: aLookup)
		ifTrue: [ ^ resolver resolve: aLookup root: anotherLookup ].
	^ self resolve: aLookup asParent root: anotherLookup
]
