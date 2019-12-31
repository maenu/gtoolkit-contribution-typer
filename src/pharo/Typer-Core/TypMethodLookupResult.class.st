Class {
	#name : #TypMethodLookupResult,
	#superclass : #TypLookupResult,
	#instVars : [
		'argumentTypes',
		'resultType',
		'signalsAlways'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #accessing }
TypMethodLookupResult >> argumentTypeAt: anInteger [
	^ argumentTypes
		cull: anInteger
		cull: lookup
		cull: resolvedBy
		cull: self
]

{ #category : #accessing }
TypMethodLookupResult >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #initialization }
TypMethodLookupResult >> initialize [
	<typTypeVariable: 'argumentTypes' as: 'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypMethodLookupResult]->TypType'>
	<typTypeVariable: 'resultType' as: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypMethodLookupResult]->TypType'>
	<typTypeVariable: 'signalsAlways' as: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypMethodLookupResult]->{!,Boolean}'>
	<typTypeVariable: 'lookup' as: 'TypMethodLookup'>
	<typTypeVariable: 'resolvedBy' as: 'TypMethodLookup'>
	super initialize.
	argumentTypes := [ TypUnknownType instance ].
	resultType := [ TypUnknownType instance ].
	signalsAlways := [ nil ]
]

{ #category : #accessing }
TypMethodLookupResult >> resultType [
	^ resultType cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypMethodLookupResult >> resultType: anObject [
	resultType := anObject
]

{ #category : #accessing }
TypMethodLookupResult >> signalsAlways [
	^ signalsAlways cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypMethodLookupResult >> signalsAlways: anObject [
	signalsAlways := anObject
]
