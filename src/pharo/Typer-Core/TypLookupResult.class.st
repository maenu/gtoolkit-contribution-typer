Class {
	#name : #TypLookupResult,
	#superclass : #Object,
	#instVars : [
		'lookup',
		'resolvedBy',
		'resolver'
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
TypLookupResult >> lookup [
	^ lookup
]

{ #category : #accessing }
TypLookupResult >> lookup: anObject [
	<typTypeArgument: 1 as: 'TypLookup'>
	lookup := anObject
]

{ #category : #accessing }
TypLookupResult >> resolvedBy [
	^ resolvedBy
]

{ #category : #accessing }
TypLookupResult >> resolvedBy: anObject [
	<typTypeArgument: 1 as: 'TypLookup'>
	resolvedBy := anObject
]

{ #category : #accessing }
TypLookupResult >> resolver [
	^ resolver
]

{ #category : #accessing }
TypLookupResult >> resolver: anObject [
	<typTypeArgument: 1 as: 'TypLookupResolver'>
	resolver := anObject
]
