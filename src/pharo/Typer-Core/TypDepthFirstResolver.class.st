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
	| parent |
	self assert: [ self canResolve: aLookup ].
	(resolver canResolve: aLookup) ifTrue: [ ^ resolver resolve: aLookup ].
	parent := self resolve: aLookup asParent.
	aLookup resolveTo: parent result by: parent resolver.
	^ parent
]
