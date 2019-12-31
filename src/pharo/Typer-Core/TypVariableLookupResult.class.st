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
	<typTypeVariable: 'lookup' as: 'TypVariableLookup'>
	<typTypeVariable: 'resolvedBy' as: 'TypVariableLookup'>
	super initialize.
	type := [ TypUnknownType instance ].
]

{ #category : #accessing }
TypVariableLookupResult >> type [
	^ type cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypVariableLookupResult >> type: anObject [
	type := anObject
]
