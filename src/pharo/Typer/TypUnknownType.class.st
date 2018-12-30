Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypUnknownType class >> instance [
	<typTypeResultAs: 'TypUnknownType'>
	^ instance ifNil: [ instance := self new ]
]

{ #category : #comparing }
TypUnknownType >> > aType [
	^ self ~= aType
]

{ #category : #'as yet unclassified' }
TypUnknownType >> asCompatibleType: aType [
	aType isNil
		ifTrue: [ ^ TypUnionType new
				types:
					{self.
					aType};
				yourself ].
	^ self
]

{ #category : #converting }
TypUnknownType >> asNamedType [
	^ self
]

{ #category : #converting }
TypUnknownType >> asNonNullableType [
	^ self
]

{ #category : #converting }
TypUnknownType >> asNullableType [
	^ TypUnionType new
		types:
			{self.
			TypNilType instance};
		yourself
]

{ #category : #copying }
TypUnknownType >> copy [
	^ self
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #accessing }
TypUnknownType >> nullable: anObject [
	"do nothing"

	
]

{ #category : #accessing }
TypUnknownType >> printOn: aStream [
	aStream << '?'
]
