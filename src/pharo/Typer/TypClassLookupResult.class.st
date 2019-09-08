Class {
	#name : #TypClassLookupResult,
	#superclass : #TypLookupResult,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypClassLookupResult >> initialize [
	<typTypeVariable: 'type' as: 'BlockClosure[TypClassLookup,TypClassLookup,TypClassLookupResult]->TypType'>
	super initialize.
	type := [ TypUnknownType instance ].
]

{ #category : #accessing }
TypClassLookupResult >> type [
	<typTypeResultAs: 'TypType'>
	^ type cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypClassLookupResult >> type: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypClassLookup,TypClassLookup,TypClassLookupResult]->TypType'>
	type := anObject
]
