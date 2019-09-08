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
	<typTypeParametersAs: 'TypTypeLookup'>
	<typTypeVariable: 'type' as: 'BlockClosure[TypTypeLookup,TypTypeLookup,TypResolver<TypLookup>]->TypType'>
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
	<typTypeArgument: 1 as: 'BlockClosure[TypTypeLookup,TypTypeLookup,TypResolver<TypLookup>]->TypType'>
	type := anObject
]
