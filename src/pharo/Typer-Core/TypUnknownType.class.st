Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#category : #'Typer-Core-Type'
}

{ #category : #comparing }
TypUnknownType >> > aType [
	^ aType isUnknown not
]

{ #category : #polymorphic }
TypUnknownType >> arguments [

	^ Array new: 32 withAll: self
]

{ #category : #polymorphic }
TypUnknownType >> at: anObject [
	^ self
]

{ #category : #accessing }
TypUnknownType >> copyWithParameters: aCollection [

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

{ #category : #polymorphic }
TypUnknownType >> result [
	^ self
]
