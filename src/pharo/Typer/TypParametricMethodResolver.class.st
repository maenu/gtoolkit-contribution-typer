Class {
	#name : #TypParametricMethodResolver,
	#superclass : #TypMethodResolver,
	#instVars : [
		'argumentTypes',
		'resultType'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypParametricMethodResolver >> argumentTypeAt: anInteger for: anAssociation resolvedBy: anotherAssociation [
	^ resultType
		cull: self
		cull: anInteger
		cull: anAssociation
		cull: anotherAssociation
]

{ #category : #accessing }
TypParametricMethodResolver >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
TypParametricMethodResolver >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #accessing }
TypParametricMethodResolver >> resultType [
	^ resultType
]

{ #category : #accessing }
TypParametricMethodResolver >> resultType: anObject [
	resultType := anObject
]

{ #category : #'as yet unclassified' }
TypParametricMethodResolver >> resultTypeFor: anAssociation resolvedBy: anotherAssociation [
	^ resultType cull: self cull: anAssociation cull: anotherAssociation
]
