Class {
	#name : #TypVariableResolver,
	#superclass : #TypResolver,
	#instVars : [
		'selector',
		'type'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypVariableResolver >> resolves: anAssociation [
	^ anAssociation key = type and: [ anAssociation value = selector ]
]

{ #category : #accessing }
TypVariableResolver >> selector [
	^ selector
]

{ #category : #accessing }
TypVariableResolver >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
TypVariableResolver >> type [
	^ type
]

{ #category : #accessing }
TypVariableResolver >> type: anObject [
	type := anObject
]
