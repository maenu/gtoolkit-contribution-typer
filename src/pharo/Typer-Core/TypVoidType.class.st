Class {
	#name : #TypVoidType,
	#superclass : #TypNamedType,
	#classInstVars : [
		'instance'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypVoidType class >> classDescription: aClassDescription [
	self shouldNotImplement
]

{ #category : #accessing }
TypVoidType class >> classDescription: aClassDescription super: aType [
	self shouldNotImplement
]

{ #category : #accessing }
TypVoidType class >> instance [
	^ instance ifNil: [ instance := self new ]
]

{ #category : #invalidation }
TypVoidType class >> invalidate [
	<script>
	super invalidate.
	instance := nil
]

{ #category : #accessing }
TypVoidType class >> named: aString [
	self shouldNotImplement
]

{ #category : #accessing }
TypVoidType class >> named: aString super: aType [
	self shouldNotImplement
]

{ #category : #comparing }
TypVoidType >> > aType [
	^ aType isVoid not
]

{ #category : #converting }
TypVoidType >> contravariant: aType [
	^ {self.
		aType} typAsType
]

{ #category : #accessing }
TypVoidType >> initialize [
	super initialize.
	self initializeName: #void.
	hasClassDescription := false
]

{ #category : #testing }
TypVoidType >> isVoid [
	^ true
]

{ #category : #printing }
TypVoidType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << 'void'
]

{ #category : #compatibility }
TypVoidType >> withParameters: aCollection [
	^ self
]

{ #category : #compatibility }
TypVoidType >> withSuper: aType [
	^ self
]
