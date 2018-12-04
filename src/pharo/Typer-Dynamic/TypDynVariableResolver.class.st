Class {
	#name : #TypDynVariableResolver,
	#superclass : #TypDynObjectResolver,
	#instVars : [
		'type'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #initialization }
TypDynVariableResolver >> initialize [
	<typTypeVariable: 'type' as: 'BlockClosure<TypVariableLookup,TypVariableLookup,TypResolver<TypLookup>,TypType>'>
	super initialize
]

{ #category : #accessing }
TypDynVariableResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypType'>
	^ aLookup receiverType asNonParametricType asNonNullableType = receiverType asNonParametricType asNonNullableType and: [ aLookup selector = selector ]
]

{ #category : #accessing }
TypDynVariableResolver >> type [
	<typTypeResultAs: 'BlockClosure<TypResolver<TypLookup>,TypVariableLookup,TypVariableLookup,TypType>'>
	^ type
]

{ #category : #accessing }
TypDynVariableResolver >> type: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<TypLookup>,TypVariableLookup,TypVariableLookup,TypType>'>
	type := anObject
]

{ #category : #accessing }
TypDynVariableResolver >> typeFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeArgument: 2 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypType'>
	^ type cull: aLookup cull: anotherLookup cull: self
]
