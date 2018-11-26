Class {
	#name : #TypVariableResolver,
	#superclass : #TypResolver,
	#instVars : [
		'selector',
		'type',
		'receiverType'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypVariableResolver >> receiverType [
	^ receiverType
]

{ #category : #accessing }
TypVariableResolver >> receiverType: anObject [
	receiverType := anObject
]

{ #category : #'as yet unclassified' }
TypVariableResolver >> resolves: anAssociation [
	^ anAssociation key = receiverType and: [ anAssociation value = selector ]
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
