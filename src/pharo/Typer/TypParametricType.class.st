Class {
	#name : #TypParametricType,
	#superclass : #TypClassType,
	#instVars : [
		'parameters'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypParametricType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ clazz = anObject clazz and: [ parameters = anObject parameters ] ] ] ]
]

{ #category : #comparing }
TypParametricType >> hash [
	^ super hash bitXor: parameters hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	super initialize.
	parameters := OrderedCollection new
]

{ #category : #accessing }
TypParametricType >> parameters [
	^ parameters
]

{ #category : #accessing }
TypParametricType >> parameters: anObject [
	parameters := anObject
]

{ #category : #printing }
TypParametricType >> printOn: aStream [
	super printOn: aStream.
	aStream << '<'.
	aStream << (',' join: (parameters collect: #printString)).
	aStream << '>'
]
