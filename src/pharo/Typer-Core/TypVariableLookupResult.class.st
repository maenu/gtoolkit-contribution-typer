Class {
	#name : #TypVariableLookupResult,
	#superclass : #TypLookupResult,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #initialization }
TypVariableLookupResult >> initialize [
	<typTypeVariable: 'type' as: 'BlockClosure[TypVariableLookup,TypVariableLookup,TypVariableLookupResult]->TypType'>
	super initialize.
	type := [ TypUnknownType instance ].
]

{ #category : #accessing }
TypVariableLookupResult >> type [
	<typTypeResultAs: 'TypType'>
	^ type cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypVariableLookupResult >> type: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypVariableLookup,TypVariableLookup,TypVariableLookupResult]->TypType'>
	type := anObject
]
