Class {
	#name : #TypMethodLookupResult,
	#superclass : #TypLookupResult,
	#instVars : [
		'argumentTypes',
		'resultType',
		'signalsAlways'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodLookupResult >> argumentTypeAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeResultAs: 'TypType'>
	^ argumentTypes
		cull: anInteger
		cull: lookup
		cull: resolvedBy
		cull: self
]

{ #category : #accessing }
TypMethodLookupResult >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	argumentTypes := anObject
]

{ #category : #initialization }
TypMethodLookupResult >> initialize [
	<typTypeParametersAs: 'TypMethodLookup'>
	<typTypeVariable: 'argumentTypes' as:
		'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	<typTypeVariable: 'resultType' as:
		'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	<typTypeVariable: 'signalsAlways' as:
		'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->!Boolean'>
	super initialize.
	argumentTypes := [ TypUnknownType instance ].
	resultType := [ TypUnknownType instance ].
	signalsAlways := [ nil ]
]

{ #category : #accessing }
TypMethodLookupResult >> resultType [
	<typTypeResultAs: 'TypType'>
	^ resultType cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypMethodLookupResult >> resultType: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	resultType := anObject
]

{ #category : #accessing }
TypMethodLookupResult >> signalsAlways [
	<typTypeResultAs: '!Boolean'>
	^ signalsAlways cull: lookup cull: resolvedBy cull: self
]

{ #category : #accessing }
TypMethodLookupResult >> signalsAlways: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->!Boolean'>
	signalsAlways := anObject
]