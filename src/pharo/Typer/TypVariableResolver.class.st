Class {
	#name : #TypVariableResolver,
	#superclass : #TypResolver,
	#instVars : [
		'variableSelector',
		'types',
		'variableType'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolver >> resolves: anAssociation [
	^ anAssociation key = variableType and: [ anAssociation value = variableSelector ]
]

{ #category : #accessing }
TypVariableResolver >> typTypes [
	^ types
]

{ #category : #accessing }
TypVariableResolver >> typTypes: anObject [
	types := anObject
]

{ #category : #'as yet unclassified' }
TypVariableResolver >> typTypesWithDiscovered: aSet [
	^ self typTypes
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
