Class {
	#name : #TypVariableResolver,
	#superclass : #TypResolver,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypVariableResolver >> initialize [
	<typTypeParametersAs: 'TypVariableLookup'>
	<typTypeVariable: 'type' as: 'BlockClosure[TypVariableLookup,TypVariableLookup,TypResolver<TypLookup>]->TypType'>
	super initialize.
	type := [ TypUnknownType instance ].
]

{ #category : #accessing }
TypVariableResolver >> type [
	<typTypeResultAs: 'BlockClosure[TypVariableLookup,TypVariableLookup,TypResolver<TypLookup>]->TypType'>
	^ type
]

{ #category : #accessing }
TypVariableResolver >> type: anObject [
	<typTypeArgument: 1 as: 'BlockClosure[TypVariableLookup,TypVariableLookup,TypResolver<TypLookup>]->TypType'>
	type := anObject
]

{ #category : #accessing }
TypVariableResolver >> typeFor: aLookup resolvedBy: anotherLookup [
	<typTypeArgument: 1 as: 'TypVariableLookup'>
	<typTypeArgument: 2 as: 'TypVariableLookup'>
	<typTypeResultAs: 'TypLookupTypeResult'>
	^ TypLookupTypeResult new
		type: (type cull: aLookup cull: anotherLookup cull: self);
		lookup: aLookup;
		resolvedBy: anotherLookup;
		resolver: self;
		yourself
]
