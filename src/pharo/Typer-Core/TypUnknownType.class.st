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

{ #category : #polymorphic }
TypUnknownType >> arguments [

	^ Array new: 32 withAll: self
]

{ #category : #polymorphic }
TypUnknownType >> at: anObject [
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

{ #category : #polymorphic }
TypUnknownType >> result [

	^ self
]

{ #category : #polymorphic }
TypUnknownType >> withParameters: aCollection [

	^ self
		  outgoingAt: { 
				  #withParameters:.
				  aCollection }
		  ifAbsentPut: [ self ]
]
