Class {
	#name : #CovSend,
	#superclass : #Object,
	#instVars : [
		'selector',
		'receiverClass',
		'argumentClasses'
	],
	#category : #Coverage
}

{ #category : #comparing }
CovSend >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ selector = anObject selector
						and: [ argumentClasses = anObject argumentClasses
								and: [ receiverClass = anObject receiverClass ] ] ] ]
]

{ #category : #accessing }
CovSend >> argumentClasses [
	^ argumentClasses
]

{ #category : #accessing }
CovSend >> argumentClasses: anObject [
	argumentClasses := anObject
]

{ #category : #comparing }
CovSend >> hash [
	^ selector hash + argumentClasses hash + receiverClass hash
]

{ #category : #printing }
CovSend >> printOn: aStream [
	receiverClass printOn: aStream.
	aStream << ' '.
	selector isUnary
		ifTrue: [ aStream << selector asString ]
		ifFalse: [ selector isBinary
				ifTrue: [ aStream << selector asString << ' ' << (argumentClasses at: 1) printString ]
				ifFalse: [ | keywords |
					keywords := ':' split: selector.
					1 to: keywords size - 1 do: [ :i | aStream << ' ' << (keywords at: i) asString << ': ' << (argumentClasses at: 1 ifAbsent: [ nil ]) printString ] ] ]
]

{ #category : #accessing }
CovSend >> receiverClass [
	^ receiverClass
]

{ #category : #accessing }
CovSend >> receiverClass: anObject [
	receiverClass := anObject
]

{ #category : #accessing }
CovSend >> selector [
	^ selector
]

{ #category : #accessing }
CovSend >> selector: anObject [
	selector := anObject
]
