Class {
	#name : #TypVariableResolver,
	#superclass : #TypObjectResolver,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolver class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters:
			{(TypParametricType new
				type: Association typAsType asNonParametricType;
				parameters:
					{Symbol typAsType.
					TypType typAsType};
				yourself)};
		yourself
]

{ #category : #initialization }
TypVariableResolver >> initialize [
	<typTypeVariable: 'type' as: 'BlockClosure<TypResolver<Symbol>,Association<TypType,Symbol>>'>
	super initialize
]

{ #category : #accessing }
TypVariableResolver >> resolves: anAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,Symbol>'>
	<typTypeResultAs: 'TypType'>
	^ anAssociation key asNonParametricType asNonNullableType = receiverType asNonParametricType asNonNullableType and: [ anAssociation value = selector ]
]

{ #category : #accessing }
TypVariableResolver >> type [
	<typTypeResultAs: 'BlockClosure<TypResolver<Symbol>,Association<TypType,Symbol>>'>
	^ type
]

{ #category : #accessing }
TypVariableResolver >> type: anObject [
	<typTypeArgument: 1 as: 'BlockClosure<TypResolver<Symbol>,Association<TypType,Symbol>>'>
	type := anObject
]

{ #category : #accessing }
TypVariableResolver >> typeFor: anAssociation resolvedBy: anotherAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,Symbol>'>
	<typTypeArgument: 2 as: 'Association<TypType,Symbol>'>
	^ type cull: self cull: anAssociation cull: anotherAssociation
]
