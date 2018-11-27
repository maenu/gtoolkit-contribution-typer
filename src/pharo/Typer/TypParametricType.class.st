Class {
	#name : #TypParametricType,
	#superclass : #TypType,
	#instVars : [
		'type',
		'parameters'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypParametricType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ type = anObject type and: [ parameters = anObject parameters ] ] ] ]
]

{ #category : #converting }
TypParametricType >> asClass [
	^ type asClass
]

{ #category : #testing }
TypParametricType >> asParametricType: someTypes [
	| copy parameters_ |
	copy := self copy.
	parameters_ := OrderedCollection ofSize: (parameters size max: someTypes size).
	parameters withIndexDo: [ :e :i | parameters_ at: i put: e ].
	someTypes withIndexDo: [ :e :i | parameters_ at: i put: e ].
	copy parameters: parameters_.
	^ copy
]

{ #category : #comparing }
TypParametricType >> canBeParametricType [
	^ true
]

{ #category : #testing }
TypParametricType >> hasSuperType [
	^ type hasSuperType
]

{ #category : #comparing }
TypParametricType >> hash [
	^ (super hash bitXor: type hash) bitXor: parameters hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	super initialize.
	parameters := OrderedCollection new
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
]

{ #category : #accessing }
TypParametricType >> parameters [
	^ parameters
]

{ #category : #accessing }
TypParametricType >> parameters: anObject [
	parameters := anObject
]

{ #category : #copying }
TypParametricType >> postCopy [
	super postCopy.
	parameters := parameters copy
]

{ #category : #printing }
TypParametricType >> printOn: aStream [
	super printOn: aStream.
	type printOn: aStream.
	aStream << '< '.
	aStream << (' , ' join: (parameters collect: #printString)).
	aStream << ' >'
]

{ #category : #accessing }
TypParametricType >> superType [
	| copy |
	copy := self copy.
	copy type: type superType.
	^ copy
]

{ #category : #accessing }
TypParametricType >> type [
	^ type
]

{ #category : #accessing }
TypParametricType >> type: anObject [
	type := anObject
]
