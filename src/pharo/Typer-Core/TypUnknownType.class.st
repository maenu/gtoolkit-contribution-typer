Class {
	#name : #TypUnknownType,
	#superclass : #TypType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypUnknownType class >> instance [

	^ instance ifNil: [ instance := self new ]
]

{ #category : #invalidation }
TypUnknownType class >> invalidate [

	<script>
	super invalidate.
	instance := nil
]

{ #category : #comparing }
TypUnknownType >> > aType [
	^ aType isUnknown not
]

{ #category : #converting }
TypUnknownType >> contravariant: aType [

	^ self
]

{ #category : #testing }
TypUnknownType >> isUnknown [
	^ true
]

{ #category : #printing }
TypUnknownType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << '?'
]

{ #category : #compatibility }
TypUnknownType >> withParameters: aCollection [

	^ self
]

{ #category : #compatibility }
TypUnknownType >> withSuper: aType [

	^ self
]
