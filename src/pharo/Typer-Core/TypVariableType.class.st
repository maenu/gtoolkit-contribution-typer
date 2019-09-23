Class {
	#name : #TypVariableType,
	#superclass : #TypType,
	#instVars : [
		'name'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypVariableType class >> named: aString [
	^ self new
		name: aString;
		yourself
]

{ #category : #comparing }
TypVariableType >> = anObject [
	^ anObject == self
		or: [ anObject class = self class and: [ anObject name = name ] ]
]

{ #category : #comparing }
TypVariableType >> > aType [
	^ true
]

{ #category : #comparing }
TypVariableType >> hash [
	^ ('@' , name) hash
]

{ #category : #testing }
TypVariableType >> isVariable [
	^ true
]

{ #category : #accessing }
TypVariableType >> name [
	^ name
]

{ #category : #accessing }
TypVariableType >> name: anObject [
	name := anObject
]

{ #category : #printing }
TypVariableType >> printOn: aStream [
	aStream
		<< '@';
		<< name asString
]
