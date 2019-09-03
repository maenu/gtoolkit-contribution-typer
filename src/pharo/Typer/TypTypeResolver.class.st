Class {
	#name : #TypTypeResolver,
	#superclass : #TypResolver,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypTypeResolver >> initialize [
	<typTypeParametersAs: 'TypTypeLookup'>
	<typTypeVariable: 'type' as: 'BlockClosure[TypTypeLookup,TypTypeLookup,TypResolver<TypLookup>]->TypType'>
	super initialize
]

{ #category : #accessing }
TypTypeResolver >> type [
	<typTypeResultAs: 'BlockClosure[TypTypeLookup,TypTypeLookup,TypResolver<TypLookup>]->TypType'>
	^ type
]

{ #category : #accessing }
TypTypeResolver >> type: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypTypeLookup,TypTypeLookup,TypResolver<TypLookup>]->TypType'>
	type := anObject
]

{ #category : #accessing }
TypTypeResolver >> typeFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypTypeLookup'>
	<typTypeArgument: 2 as: 'TypTypeLookup'>
	<typTypeResultAs: 'TypType'>
	^ type cull: aLookup cull: anotherLookup cull: self
]
