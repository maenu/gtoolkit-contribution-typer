Class {
	#name : #TypVariableResolver,
	#superclass : #TypObjectResolver,
	#instVars : [
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolver >> resolves: anAssociation [
	^ anAssociation key = receiverType and: [ anAssociation value = selector ]
]

{ #category : #accessing }
TypVariableResolver >> type [
	^ type
]

{ #category : #accessing }
TypVariableResolver >> type: anObject [
	type := anObject
]

{ #category : #'as yet unclassified' }
TypVariableResolver >> typeFor: anAssociation resolvedBy: anotherAssociation [
	^ type cull: self cull: anAssociation cull: anotherAssociation
]
