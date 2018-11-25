Class {
	#name : #TypDynMessage,
	#superclass : #Object,
	#instVars : [
		'selector',
		'argumentTypes',
		'receiverTypes'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #comparing }
TypDynMessage >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ selector = anObject selector and: [ argumentTypes = anObject argumentTypes and: [ receiverTypes = anObject receiverType ] ] ] ]
]

{ #category : #accessing }
TypDynMessage >> argumentTypes [
	^ argumentTypes
]

{ #category : #accessing }
TypDynMessage >> argumentTypes: anObject [
	argumentTypes := anObject
]

{ #category : #comparing }
TypDynMessage >> hash [
	^ selector hash bitXor: (argumentTypes hash bitXor: receiverTypes hash)
]

{ #category : #printing }
TypDynMessage >> printOn: aStream [
	receiverTypes printOn: aStream.
	aStream << ' '.
	selector isUnary
		ifTrue: [ aStream << selector asString ]
		ifFalse: [ selector isBinary
				ifTrue: [ aStream << selector asString << ' ' << (argumentTypes at: 1) printString ]
				ifFalse: [ | keywords |
					keywords := ':' split: selector.
					1 to: keywords size - 1 do: [ :i | aStream << ' ' << (keywords at: i) asString << ': ' << (argumentTypes at: i ifAbsent: [ nil ]) printString ] ] ]
]

{ #category : #accessing }
TypDynMessage >> receiverType [
	^ receiverTypes
]

{ #category : #accessing }
TypDynMessage >> receiverType: anObject [
	receiverTypes := anObject
]

{ #category : #accessing }
TypDynMessage >> selector [
	^ selector
]

{ #category : #accessing }
TypDynMessage >> selector: anObject [
	selector := anObject
]
