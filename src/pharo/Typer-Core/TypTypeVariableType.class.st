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
	self flag: 'TODO get rid off it'.
	(anotherType isParametric
		and:
			[ (anotherType "typCastAs TypParametricType") parameters includes: self name ])
		ifTrue:
			[ ^ (anotherType "typCastAs TypParametricType") at: self name put: aType ].
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
TypTypeVariableType >> printOn: aStream [
	aStream nextPutAll: name asString.
	superType = ProtoObject typAsType
		ifFalse: [ aStream nextPutAll: '<='.
			superType printOn: aStream ]
]

{ #category : #accessing }
TypTypeVariableType >> resolveIn: aType [
	self flag: 'TODO get rid off it'.
	aType isParametric
		ifTrue: [ [ ^ aType at: self name ]
				on: KeyNotFound
				do: [ "continue in super" ] ].
	^ aType hasSuperType
		ifTrue: [ self resolveIn: aType superType ]
		ifFalse: [ self ]
]
