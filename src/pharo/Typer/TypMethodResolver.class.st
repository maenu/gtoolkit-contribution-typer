Class {
	#name : #TypMethodResolver,
	#superclass : #TypResolver,
	#instVars : [
		'argumentTypes',
		'resultType',
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolver >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #accessing }
TypMethodResolver >> receiverType [
	^ receiverType
]

{ #category : #accessing }
TypMethodResolver >> receiverType: anObject [
	receiverType := anObject
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: anAssociation [
	^ anAssociation key = receiverType and: [ anAssociation value = selector ]
]

{ #category : #accessing }
TypMethodResolver >> resultType [
	^ resultType
]

{ #category : #accessing }
TypMethodResolver >> resultType: anObject [
	resultType := anObject
]

{ #category : #accessing }
TypMethodResolver >> selector [
	^ selector
]

{ #category : #accessing }
TypMethodResolver >> selector: anObject [
	selector := anObject
]
