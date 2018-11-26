Class {
	#name : #TypVariableResolver,
	#superclass : #TypResolver,
	#instVars : [
		'variableSelector',
		'variableType',
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolver >> resolves: anAssociation [
	^ anAssociation key = variableType and: [ anAssociation value = variableSelector ]
]

{ #category : #accessing }
TypVariableResolver >> typType [
	^ type
]

{ #category : #accessing }
TypVariableResolver >> typType: anObject [
	type := anObject
]

{ #category : #'as yet unclassified' }
TypVariableResolver >> typTypeWithDiscovered: aSet [
	^ self typType
]

{ #category : #accessing }
TypVariableResolver >> variableSelector [
	^ variableSelector
]

{ #category : #accessing }
TypVariableResolver >> variableSelector: anObject [
	variableSelector := anObject
]

{ #category : #accessing }
TypVariableResolver >> variableType [
	^ variableType
]

{ #category : #accessing }
TypVariableResolver >> variableType: anObject [
	variableType := anObject
]
