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
TypParametricType >> asNonParametricType [
	^ type asNonParametricType
]

{ #category : #testing }
TypParametricType >> asParametricType: someTypes [
	| copy parameters_ |
	copy := self copy.
	parameters_ := (OrderedCollection ofSize: (parameters size max: someTypes size)) "typParameters TypType".
	parameters withIndexDo: [ :e :i | parameters_ at: i put: e ].
	someTypes withIndexDo: [ :e :i | parameters_ at: i put: e ].
	copy parameters: parameters_.
	^ copy
]

{ #category : #comparing }
TypParametricType >> canBeParametricType [
	^ true
]

{ #category : #converting }
TypParametricType >> hasClass [
	^ type hasClass
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
	<typTypeVariable: 'type' as: 'TypType'>
	<typTypeVariable: 'parameters' as: 'OrderedCollection<TypType>'>
	super initialize.
	parameters := OrderedCollection new
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
]

{ #category : #accessing }
TypParametricType >> nullable [
	^ type nullable
]

{ #category : #accessing }
TypParametricType >> nullable: anObject [
	type nullable: anObject
]

{ #category : #accessing }
TypParametricType >> parameters [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ parameters
]

{ #category : #accessing }
TypParametricType >> parameters: anObject [
	<typTypeArgument: 1 as: 'OrderedCollection<TypType>'>
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
	| superType |
	self assert: [ self hasSuperType ].
	superType := type superType.
	^ superType isParametric
		ifTrue: [ self copy
				type: type superType asNonParametricType;
				yourself ]
		ifFalse: [ superType ]
]

{ #category : #accessing }
TypParametricType >> type [
	<typTypeResultAs: 'TypType'>
	^ type
]

{ #category : #accessing }
TypParametricType >> type: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	type := anObject
]
