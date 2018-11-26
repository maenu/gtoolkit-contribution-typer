Class {
	#name : #TypNonParametricMethodResolver,
	#superclass : #TypMethodResolver,
	#instVars : [
		'argumentTypes',
		'resultType'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypNonParametricMethodResolver >> argumentTypeAt: anInteger for: anAssociation resolvedBy: anotherAssociation [
	^ argumentTypes at: anInteger
]

{ #category : #accessing }
TypNonParametricMethodResolver >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
TypNonParametricMethodResolver >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #accessing }
TypNonParametricMethodResolver >> resultType [
	^ resultType
]

{ #category : #accessing }
TypNonParametricMethodResolver >> resultType: anObject [
	resultType := anObject
]

{ #category : #'as yet unclassified' }
TypNonParametricMethodResolver >> resultTypeFor: anAssociation resolvedBy: anotherAssociation [
	^ resultType
]
