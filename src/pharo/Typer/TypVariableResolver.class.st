Class {
	#name : #TypVariableResolver,
	#superclass : #TypObjectResolver,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypVariableResolver >> initialize [
	<typTypeVariable: 'type' as: 'BlockClosure<TypResolver<TypLookup>,TypVariableLookup,TypVariableLookup,TypType>'>
	super initialize
]

{ #category : #accessing }
TypVariableResolver >> resolves: aLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypType'>
	^ aLookup receiverType asNonParametricType asNonNullableType = receiverType asNonParametricType asNonNullableType and: [ aLookup selector = selector ]
]

{ #category : #accessing }
TypVariableResolver >> type [
	<typTypeResultAs: 'BlockClosure<TypResolver<TypLookup>,TypVariableLookup,TypVariableLookup,TypType>'>
	^ type
]

{ #category : #accessing }
TypVariableResolver >> type: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<TypLookup>,TypVariableLookup,TypVariableLookup,TypType>'>
	type := anObject
]

{ #category : #accessing }
TypVariableResolver >> typeFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeArgument: 2 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypType'>
	^ type cull: aLookup cull: anotherLookup cull: self
]
