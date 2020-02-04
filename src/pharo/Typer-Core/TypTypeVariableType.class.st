Class {
	#name : #TypTypeVariableType,
	#superclass : #TypType,
	#instVars : [
		'name',
		'scope'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypTypeVariableType class >> named: aString [
	<typTypeArgument: 1 as: 'String'>
	^ self new
		initializeName: aString;
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
		or: [ anObject class = self class
				and: [ anObject name = name
						and: [ anObject superType = superType ] ] ]
]

{ #category : #comparing }
TypTypeVariableType >> > aType [
	^ superType >= aType
]

{ #category : #accessing }
TypTypeVariableType >> assign: aType in: anotherType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeArgument: 2 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	self assert: [ name ~= '@self' ].
	(scope == anotherType)
		ifTrue: [ ^ scope at: name put: aType ].
	(aType isParametric and: [ aType parameters includes: name ])
		ifTrue: [ ^ aType at: name put: aType ].
	^ anotherType hasSuperType
		ifTrue: [ self assign: aType in: anotherType superType ]
		ifFalse: [ self ]
]

{ #category : #'as yet unclassified' }
TypTypeVariableType >> canUnderstand: aSymbol [
	^ self superType canUnderstand: aSymbol
]

{ #category : #comparing }
TypTypeVariableType >> hash [
	^ name hash bitXor: superType hash
]

{ #category : #initialization }
TypTypeVariableType >> initialize [
	<typTypeVariable: 'name' as: 'String'>
	<typTypeVariable: 'superType' as: 'TypType'>
	super initialize.
	superType := ProtoObject typAsType
]

{ #category : #accessing }
TypTypeVariableType >> initializeName: aString [
	<typTypeArgument: 1 as: 'String'>
	self assert: [ aString size > 1 ].
	self assert: [ aString first = $@ ].
	name := aString
]

{ #category : #testing }
TypTypeVariableType >> isTypeVariable [
	^ true
]

{ #category : #'as yet unclassified' }
TypTypeVariableType >> lookupSelector: aSymbol [
	^ self superType lookupSelector: aSymbol
]

{ #category : #accessing }
TypTypeVariableType >> name [
	^ name
]

{ #category : #printing }
TypTypeVariableType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream nextPutAll: name asString.
	superType = ProtoObject typAsType
		ifFalse: [ aStream nextPutAll: '<='.
			superType printOn: aStream skipping: anIdentitySet , {self} ]
]

{ #category : #accessing }
TypTypeVariableType >> resolveIn: aType [
	name = '@self'
		ifTrue: [ ^ aType ].
	scope == aType
		ifTrue: [ ^ scope at: name ].
	(aType isParametric and: [ aType parameters includes: name ])
		ifTrue: [ ^ aType at: name ].
	^ aType hasSuperType
		ifTrue: [ self resolveIn: aType superType ]
		ifFalse: [ self ]
]

{ #category : #accessing }
TypTypeVariableType >> scope [
	^ scope
]

{ #category : #accessing }
TypTypeVariableType >> scope: anObject [
	self assert: [ scope isNil ].
	scope := anObject
]
