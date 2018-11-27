Class {
	#name : #TypMethodResolver,
	#superclass : #TypObjectResolver,
	#instVars : [
		'argumentTypes',
		'resultType'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypMethodResolver >> argumentTypeAt: anInteger for: anAssociation resolvedBy: anotherAssociation [
	^ argumentTypes
		cull: self
		cull: anInteger
		cull: anAssociation
		cull: anotherAssociation
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
TypMethodResolver >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resolves: anAssociation [
	^ anAssociation key = receiverType and: [ anAssociation value key = selector ]
]

{ #category : #accessing }
TypMethodResolver >> resultType [
	^ resultType
]

{ #category : #accessing }
TypMethodResolver >> resultType: anObject [
	resultType := anObject
]

{ #category : #'as yet unclassified' }
TypMethodResolver >> resultTypeFor: anAssociation resolvedBy: anotherAssociation [
	^ resultType cull: self cull: anAssociation cull: anotherAssociation
]
