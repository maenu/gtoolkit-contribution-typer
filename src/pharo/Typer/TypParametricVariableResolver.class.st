Class {
	#name : #TypParametricVariableResolver,
	#superclass : #TypVariableResolver,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypParametricVariableResolver >> type [
	^ type
]

{ #category : #accessing }
TypParametricVariableResolver >> type: anObject [
	type := anObject
]

{ #category : #'as yet unclassified' }
TypParametricVariableResolver >> typeFor: anAssociation resolvedBy: anotherAssociation [
	^ type cull: self cull: anAssociation cull: anotherAssociation
]
