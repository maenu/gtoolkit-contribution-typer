Class {
	#name : #CovMessage,
	#superclass : #Object,
	#instVars : [
		'selector',
		'receiverClass',
		'argumentClasses',
		'resultClass'
	],
	#category : #'Coverage-Core'
}

{ #category : #comparing }
CovMessage >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ selector = anObject selector
						and: [ argumentClasses = anObject argumentClasses and: [ receiverClass = anObject receiverClass and: [ resultClass = anObject resultClass ] ] ] ] ]
]

{ #category : #accessing }
CovMessage >> argumentClasses [
	^ argumentClasses
]

{ #category : #accessing }
CovMessage >> argumentClasses: anObject [
	argumentClasses := anObject
]

{ #category : #comparing }
CovMessage >> hash [
	^ selector hash + argumentClasses hash + receiverClass hash + resultClass hash
]

{ #category : #printing }
CovMessage >> printOn: aStream [
	receiverClass printOn: aStream.
	aStream << ' '.
	selector isUnary
		ifTrue: [ aStream << selector asString ]
		ifFalse: [ selector isBinary
				ifTrue: [ aStream << selector asString << ' ' << (argumentClasses at: 1) printString ]
				ifFalse: [ | keywords |
					keywords := ':' split: selector.
					1 to: keywords size - 1 do: [ :i | aStream << ' ' << (keywords at: i) asString << ': ' << (argumentClasses at: i ifAbsent: [ nil ]) printString ] ] ].
	aStream << ' ' << resultClass asString
]

{ #category : #accessing }
CovMessage >> receiverClass [
	^ receiverClass
]

{ #category : #accessing }
CovMessage >> receiverClass: anObject [
	receiverClass := anObject
]

{ #category : #accessing }
CovMessage >> resultClass [
	^ resultClass
]

{ #category : #accessing }
CovMessage >> resultClass: anObject [
	resultClass := anObject
]

{ #category : #accessing }
CovMessage >> selector [
	^ selector
]

{ #category : #accessing }
CovMessage >> selector: anObject [
	selector := anObject
]
