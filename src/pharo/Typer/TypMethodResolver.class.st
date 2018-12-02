Class {
	#name : #TypMethodResolver,
	#superclass : #TypObjectResolver,
	#instVars : [
		'argumentTypes',
		'resultType'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypMethodResolver class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters: {TypMethodLookup typAsType};
		yourself
]

{ #category : #accessing }
TypMethodResolver >> argumentTypeAt: anInteger for: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeArgument: 3 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ argumentTypes
		cull: self
		cull: anInteger
		cull: aLookup
		cull: anotherLookup
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes [
	<typTypeResultAs: 'BlockClosure<TypResolver<TypMethodLookup>,Integer,TypMethodLookup,TypMethodLookup,TypType>'>
	^ argumentTypes
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<TypMethodLookup>,Integer,TypMethodLookup,TypMethodLookup,TypType>'>
	argumentTypes := anObject
]

{ #category : #initialization }
TypMethodResolver >> initialize [
	<typTypeVariable: 'argumentTypes' as: 'BlockClosure<TypResolver<TypMethodLookup>,Integer,TypMethodLookup,TypMethodLookup,TypType>'>
	<typTypeVariable: 'resultType' as: 'BlockClosure<TypResolver<TypMethodLookup>,TypMethodLookup,TypMethodLookup,TypType>'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: aLookup [
	^ aLookup receiverType asNonParametricType asNonNullableType = receiverType asNonParametricType asNonNullableType and: [ aLookup selector = selector ]
]

{ #category : #accessing }
TypMethodResolver >> resultType [
	<typTypeResultAs: 'BlockClosure<TypResolver<TypMethodLookup>,TypMethodLookup,TypMethodLookup,TypType>'>
	^ resultType
]

{ #category : #accessing }
TypMethodResolver >> resultType: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<TypMethodLookup>,TypMethodLookup,TypMethodLookup,TypType>'>
	resultType := anObject
]

{ #category : #accessing }
TypMethodResolver >> resultTypeFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypMethodLookup'>
	<typTypeArgument: 2 as: 'TypMethodLookup'>
	<typTypeResultAs: 'TypType'>
	^ resultType cull: self cull: aLookup cull: anotherLookup
]
