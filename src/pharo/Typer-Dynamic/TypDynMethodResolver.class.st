Class {
	#name : #TypDynMethodResolver,
	#superclass : #TypDynObjectResolver,
	#instVars : [
		'argumentTypes',
		'resultType'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #accessing }
TypDynMethodResolver >> argumentTypeAt: anInteger for: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeArgument: 3 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ argumentTypes
		cull: anInteger
		cull: aLookup
		cull: anotherLookup
		cull: self
]

{ #category : #accessing }
TypDynMethodResolver >> argumentTypes [
	<typTypeResultAs: 'BlockClosure<TypResolver<TypMethodLookup>,Integer,TypMethodLookup,TypMethodLookup,TypType>'>
	^ argumentTypes
]

{ #category : #accessing }
TypDynMethodResolver >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<TypMethodLookup>,Integer,TypMethodLookup,TypMethodLookup,TypType>'>
	argumentTypes := anObject
]

{ #category : #initialization }
TypDynMethodResolver >> initialize [
	<typTypeVariable: 'argumentTypes' as: 'BlockClosure<Integer,TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>,TypType>'>
	<typTypeVariable: 'resultType' as: 'BlockClosure<TypMethodLookup,TypMethodLookup,TypResolver<TypMethodLookup>,TypType>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypDynMethodResolver >> resolves: aLookup [
	^ aLookup receiverType asNonParametricType asNonNullableType = receiverType asNonParametricType asNonNullableType and: [ aLookup selector = selector ]
]

{ #category : #accessing }
TypDynMethodResolver >> resultType [
	<typTypeResultAs: 'BlockClosure<TypResolver<TypMethodLookup>,TypMethodLookup,TypMethodLookup,TypType>'>
	^ resultType
]

{ #category : #accessing }
TypDynMethodResolver >> resultType: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<TypMethodLookup>,TypMethodLookup,TypMethodLookup,TypType>'>
	resultType := anObject
]

{ #category : #accessing }
TypDynMethodResolver >> resultTypeFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ resultType cull: aLookup cull: anotherLookup cull: self
]
