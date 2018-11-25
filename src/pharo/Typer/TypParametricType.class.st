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
	^ self == anObject or: [ self class = anObject class and: [ clazz = anObject clazz and: [ parameters = anObject parameters ] ] ]
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
	| size |
	super printOn: aStream.
	aStream << '<'.
	size := parameters size.
	1 to: size do: [ :e | 
		(parameters at: e) printOn: aStream.
		e < size
			ifTrue: [ aStream << '>' ] ].
	aStream << '>'
]
