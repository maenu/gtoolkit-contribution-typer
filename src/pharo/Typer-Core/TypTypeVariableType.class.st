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
		name: aString;
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

{ #category : #comparing }
TypTypeVariableType >> hash [
	^ name hash
]

{ #category : #testing }
TypTypeVariableType >> isTypeVariable [
	^ true
]

{ #category : #accessing }
TypTypeVariableType >> name [
	^ name
]

{ #category : #accessing }
TypTypeVariableType >> name: aString [
	self assert: [ aString first = $@ ].
	name := aString
]

{ #category : #printing }
TypTypeVariableType >> printOn: aStream [
	aStream nextPutAll: name asString
]
