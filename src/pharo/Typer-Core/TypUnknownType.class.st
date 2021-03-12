Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypUnknownType >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #comparing }
TypUnknownType >> > aType [
	^ aType isUnknown not
]

{ #category : #polymorphic }
TypUnknownType >> at: anObject [
	^ self
]

{ #category : #accessing }
TypUnknownType >> hash [
	^ self class hash bitXor: 7
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

{ #category : #polymorphic }
TypUnknownType >> result [
	^ self
]
