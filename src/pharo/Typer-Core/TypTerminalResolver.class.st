Class {
	#name : #TypTerminalResolver,
	#superclass : #TypResolver,
	#instVars : [
		'resolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypTerminalResolver class >> resolver: aResolver [
	^ self new
		initializeResolver: aResolver;
		yourself
]

{ #category : #accessing }
TypTerminalResolver >> canResolve: aLookup [
	^ true
]

{ #category : #accessing }
TypTerminalResolver >> initializeResolver: aResolver [
	resolver := aResolver
]

{ #category : #accessing }
TypTerminalResolver >> resolve: aLookup [
	aLookup isResolved
		ifTrue: [ aLookup resolver update: aLookup.
			^ aLookup ].
	(resolver canResolve: aLookup) ifTrue: [ ^ resolver resolve: aLookup ].
	aLookup resolveTo: TypUnknownType instance by: self.
	^ aLookup
]

{ #category : #accessing }
TypTerminalResolver >> resolver [
	^ resolver
]
