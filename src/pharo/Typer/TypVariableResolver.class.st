Class {
	#name : #TypVariableResolver,
	#superclass : #TypResolver,
	#instVars : [
		'variableClass',
		'variableSelector',
		'types'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolver >> resolves: anAssociation [
	^ anAssociation key = variableClass and: [ anAssociation value = variableSelector ]
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
TypVariableResolver >> variableClass [
	^ variableClass
]

{ #category : #accessing }
TypVariableResolver >> variableClass: anObject [
	variableClass := anObject
]

{ #category : #accessing }
TypVariableResolver >> variableSelector [
	^ variableSelector
]

{ #category : #accessing }
TypVariableResolver >> variableSelector: anObject [
	variableSelector := anObject
]
