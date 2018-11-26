Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypUnknownType class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #converting }
TypUnknownType >> asClass [
	TypNoClassFoundError signal
]

{ #category : #accessing }
TypUnknownType >> hasSuperType [
	^ false
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #'as yet unclassified' }
TypUnknownType >> lookupMethod: aSymbol [
	TypNoMethodFoundError signal
]

{ #category : #'as yet unclassified' }
TypUnknownType >> lookupVariable: aSymbol [
	TypNoVariableFoundError signal
]

{ #category : #accessing }
TypUnknownType >> printOn: aStream [
	aStream << '?'
]

{ #category : #accessing }
TypUnknownType >> superType [
	TypNoSuperTypeError signal
]
