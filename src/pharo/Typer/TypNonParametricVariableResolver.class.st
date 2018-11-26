Class {
	#name : #TypNonParametricVariableResolver,
	#superclass : #TypVariableResolver,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypNonParametricVariableResolver >> type [
	^ type
]

{ #category : #accessing }
TypNonParametricVariableResolver >> type: anObject [
	type := anObject
]

{ #category : #'as yet unclassified' }
TypNonParametricVariableResolver >> typeFor: anAssociation resolvedBy: anotherAssociation [
	^ type
]
