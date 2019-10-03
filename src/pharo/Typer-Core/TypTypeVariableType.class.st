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
	^ self initializeWithName: aString
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
TypTypeVariableType >> asTypeCompatibleWith: aType [
	^ aType isTypeVariable
		ifTrue: [ self assert: [ self = aType ].
			self ]
		ifFalse: [ super asTypeCompatibleWith: aType ]
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

{ #category : #accessing }
TypTypeVariableType >> name [
	^ name
]

{ #category : #printing }
TypTypeVariableType >> printOn: aStream [
	aStream nextPutAll: name asString
]
