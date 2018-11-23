Class {
	#name : #TypDynMessage,
	#superclass : #Object,
	#instVars : [
		'selector',
		'receiverClass',
		'argumentClasses'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #comparing }
TypDynMessage >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ selector = anObject selector and: [ argumentClasses = anObject argumentClasses and: [ receiverClass = anObject receiverClass ] ] ] ]
]

{ #category : #accessing }
TypDynMessage >> argumentClasses [
	^ argumentClasses
]

{ #category : #accessing }
TypDynMessage >> argumentClasses: anObject [
	argumentClasses := anObject
]

{ #category : #comparing }
TypDynMessage >> hash [
	^ selector hash + argumentClasses hash + receiverClass hash
]

{ #category : #printing }
TypDynMessage >> printOn: aStream [
	receiverClass printOn: aStream.
	aStream << ' '.
	selector isUnary
		ifTrue: [ aStream << selector asString ]
		ifFalse: [ selector isBinary
				ifTrue: [ aStream << selector asString << ' ' << (argumentClasses at: 1) printString ]
				ifFalse: [ | keywords |
					keywords := ':' split: selector.
					1 to: keywords size - 1 do: [ :i | aStream << ' ' << (keywords at: i) asString << ': ' << (argumentClasses at: i ifAbsent: [ nil ]) printString ] ] ]
]

{ #category : #accessing }
TypDynMessage >> receiverClass [
	^ receiverClass
]

{ #category : #accessing }
TypDynMessage >> receiverClass: anObject [
	receiverClass := anObject
]

{ #category : #accessing }
TypDynMessage >> selector [
	^ selector
]

{ #category : #accessing }
TypDynMessage >> selector: anObject [
	selector := anObject
]
