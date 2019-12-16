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
	<typTypeArgument: 1 as: 'String'>
	^ self new
		initializeWithName: aString;
		yourself
]

{ #category : #'instance creation' }
TypTypeVariableType class >> named: aString superType: aType [
	<typTypeArgument: 1 as: 'String'>
	<typTypeArgument: 2 as: 'TypType'>
	^ (self named: aString)
		superType: aType;
		yourself
]

{ #category : #comparing }
TypTypeVariableType >> = anObject [
	^ anObject == self
		or: [ anObject class = self class and: [ (anObject "typCastAs TypTypeVariableType") name = name ] ]
]

{ #category : #comparing }
TypTypeVariableType >> > aType [
	^ superType >= aType
]

{ #category : #'as yet unclassified' }
TypTypeVariableType >> canUnderstand: aSymbol [
	^ false
]

{ #category : #comparing }
TypTypeVariableType >> hash [
	^ name hash
]

{ #category : #initialization }
TypTypeVariableType >> initialize [
	<typTypeVariable: 'name' as: 'String'>
	<typTypeVariable: 'superType' as:'TypType'>
	super initialize.
	superType := Object typAsType
]

{ #category : #accessing }
TypTypeVariableType >> initializeWithName: aString [
	<typTypeArgument: 1 as: 'String'>
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
	aStream nextPutAll: name asString.
	superType = Object typAsType
		ifFalse: [ aStream nextPutAll: '<='.
			superType printOn: aStream ]
]

{ #category : #accessing }
TypTypeVariableType >> resolveIn: aType [
	(aType isParametric
		and: [ (aType "typCastAs TypParametricType") bindings includes: self ])
		ifTrue: [ ^ (aType "typCastAs TypParametricType") bindings at: self ].
	^ aType hasSuperType
		ifTrue: [ self resolveIn: aType superType ]
		ifFalse: [ self ]
]
