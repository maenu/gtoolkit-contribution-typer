Class {
	#name : #TypResolver,
	#superclass : #Object,
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypResolver class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters: {TypUnknownType instance};
		yourself
]

{ #category : #accessing }
TypResolver >> resolverFor: anAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,?>'>
	<typTypeResultAs: 'TypResolver<?>'>
	^ self
]

{ #category : #accessing }
TypResolver >> resolves: anAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,?>'>
	<typTypeResultAs: 'Boolean'>
	^ false
]
