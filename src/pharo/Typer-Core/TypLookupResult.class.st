Class {
	#name : #TypLookupResult,
	#superclass : #Object,
	#instVars : [
		'resolvedLookup',
		'originalLookup',
		'resolvedResolver'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypLookupResult >> initialize [
	<typTypeVariable: 'lookup' as: 'TypLookup'>
	<typTypeVariable: 'resolvedBy' as: 'TypLookup'>
	<typTypeVariable: 'resolver' as: 'TypLookupResolver'>
	super initialize
]

{ #category : #accessing }
TypLookupResult >> originalLookup [
	^ originalLookup
]

{ #category : #accessing }
TypLookupResult >> originalLookup: anObject [
	<typTypeArgument: 1 as: 'TypLookup'>
	originalLookup := anObject
]

{ #category : #accessing }
TypLookupResult >> resolvedLookup [
	^ resolvedLookup
]

{ #category : #accessing }
TypLookupResult >> resolvedLookup: anObject [
	<typTypeArgument: 1 as: 'TypLookup'>
	resolvedLookup := anObject
]

{ #category : #accessing }
TypLookupResult >> resolvedResolver [
	^ resolvedResolver
]

{ #category : #accessing }
TypLookupResult >> resolvedResolver: anObject [
	<typTypeArgument: 1 as: 'TypLookupResolver'>
	resolvedResolver := anObject
]
