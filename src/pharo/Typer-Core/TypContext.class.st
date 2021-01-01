Class {
	#name : #TypContext,
	#superclass : #Object,
	#instVars : [
		'selfType'
	],
	#category : #'Typer-Core-Typing'
}

{ #category : #'as yet unclassified' }
TypContext class >> selfType: aType [
	^ self new
		initializeSelfType: aType;
		yourself
]

{ #category : #comparing }
TypContext >> = anObject [
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ selfType = anObject selfType
]

{ #category : #comparing }
TypContext >> hash [
	^ selfType hash
]

{ #category : #initialization }
TypContext >> initializeSelfType: aType [
	self assert: [ selfType isNil ].
	selfType := aType
]

{ #category : #accessing }
TypContext >> selfType [
	^ selfType
]
