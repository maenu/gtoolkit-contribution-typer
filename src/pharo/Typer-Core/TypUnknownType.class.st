Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#category : #'Typer-Core-Type'
}

{ #category : #comparing }
TypUnknownType >> > aType [
	^ self ~= aType
]

{ #category : #converting }
TypUnknownType >> asNonNullable [
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
TypUnknownType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << '?'
]
