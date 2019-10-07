Class {
	#name : #TypTypeVariableType,
	#superclass : #TypType,
	#instVars : [
		'name'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypTypeVariableType class >> named: aString [
	^ self new
		initializeWithName: aString;
		yourself
]

{ #category : #comparing }
TypTypeVariableType >> = anObject [
	^ anObject == self
		or: [ anObject class = self class and: [ anObject name = name ] ]
]

{ #category : #comparing }
TypTypeVariableType >> > aType [
	^ true
]

{ #category : #'as yet unclassified' }
TypTypeVariableType >> canUnderstand: aSymbol [
	^ false
]

{ #category : #testing }
TypTypeVariableType >> hasSuperType [
	^ false
]

{ #category : #comparing }
TypTypeVariableType >> hash [
	^ name hash
]

{ #category : #accessing }
TypTypeVariableType >> initializeWithName: aString [
	self assert: [ aString first = $@ ].
	name := aString
]

{ #category : #testing }
TypTypeVariableType >> isTypeVariable [
	^ true
]

{ #category : #'as yet unclassified' }
TypTypeVariableType >> lookupSelector: aSymbol [
	self shouldNotImplement
]

{ #category : #accessing }
TypTypeVariableType >> name [
	^ name
]

{ #category : #printing }
TypTypeVariableType >> printOn: aStream [
	aStream nextPutAll: name asString
]

{ #category : #'as yet unclassified' }
TypTypeVariableType >> resolveIn: aType [
	((aType isParametric or: [ aType isFunction ])
		and: [ aType bindings includes: self ])
		ifTrue: [ ^ aType bindings at: self ].
	^ aType hasSuperType
		ifTrue: [ self resolveIn: aType superType ]
		ifFalse: [ self ]
]

{ #category : #'as yet unclassified' }
TypTypeVariableType >> superType [
	self shouldNotImplement
]
