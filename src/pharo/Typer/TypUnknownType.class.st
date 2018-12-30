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

{ #category : #'as yet unclassified' }
TypUnknownType >> asTypeCompatibleWith: aType [
	aType isNil
		ifTrue: [ ^ TypUnionType new
				types:
					{self.
					aType};
				yourself ].
	^ self
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
