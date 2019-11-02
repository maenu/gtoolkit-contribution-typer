Class {
	#name : #TypClassDescriptionLookupResult,
	#superclass : #TypLookupResult,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypClassDescriptionLookupResult >> initialize [
	<typTypeVariable: 'type' as: 'BlockClosure[TypClassDescriptionLookup,TypClassDescriptionLookup,TypClassDescriptionLookupResult]->TypType'>
	super initialize.
	type := [ TypUnknownType instance ].
]

{ #category : #accessing }
TypClassDescriptionLookupResult >> type [
	<typTypeResultAs: 'TypType'>
	^ type cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypClassDescriptionLookupResult >> type: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypClassDescriptionLookup,TypClassDescriptionLookup,TypClassDescriptionLookupResult]->TypType'>
	type := anObject
]
