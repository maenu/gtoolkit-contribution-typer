Class {
	#name : #TypMethodResolver,
	#superclass : #TypResolver,
	#instVars : [
		'argumentTypes',
		'resultType'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolver >> argumentTypeAt: anInteger for: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeArgument: 3 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ [ argumentTypes
		cull: anInteger
		cull: aLookup
		cull: anotherLookup
		cull: self ]
		on: Error
		do: [ :e | 
			TypNoCompatibleTypeError new
				cause: e;
				signal ]
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes [
	<typTypeResultAs: 'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	^ argumentTypes
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	argumentTypes := anObject
]

{ #category : #initialization }
TypMethodResolver >> initialize [
	<typTypeParametersAs: 'TypMethodLookup'>
	<typTypeVariable: 'argumentTypes' as: 'BlockClosure[Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	<typTypeVariable: 'resultType' as: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	^ true
]

{ #category : #accessing }
TypMethodResolver >> resultType [
	<typTypeResultAs: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	^ resultType
]

{ #category : #accessing }
TypMethodResolver >> resultType: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>]->TypType'>
	resultType := anObject
]

{ #category : #accessing }
TypMethodResolver >> resultTypeFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ [ resultType cull: aLookup cull: anotherLookup cull: self ]
		on: Error
		do: [ :e | 
			TypNoCompatibleTypeError new
				cause: e;
				signal ]
]
