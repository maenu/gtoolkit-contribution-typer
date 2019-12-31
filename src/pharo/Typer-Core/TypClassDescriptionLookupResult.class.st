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
	<typTypeVariable: 'lookup' as: 'TypClassDescriptionLookup'>
	<typTypeVariable: 'resolvedBy' as: 'TypClassDescriptionLookup'>
	super initialize.
	type := [ TypUnknownType instance ].
]

{ #category : #accessing }
TypClassDescriptionLookupResult >> type [
	^ type cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypClassDescriptionLookupResult >> type: anObject [
	type := anObject
]
