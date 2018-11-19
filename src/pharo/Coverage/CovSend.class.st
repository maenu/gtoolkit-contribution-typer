Class {
	#name : #CovSend,
	#superclass : #Object,
	#instVars : [
		'selector',
		'receiverClass',
		'argumentClasses',
		'resultClass'
	],
	#category : #Coverage
}

{ #category : #comparing }
CovSend >> = anObject [
	^ super = anObject
		and: [ self class = anObject class
				and: [ selector = anObject selector
						and: [ argumentClasses = anObject argumentClasses
								and: [ receiverClass = anObject receiverClass and: [ resultClass = anObject resultClass ] ] ] ] ]
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
	^ selector hash + argumentClasses hash + receiverClass hash + resultClass hash
]

{ #category : #printing }
CovSend >> printOn: aStream [
	receiverClass printOn: aStream.
	aStream << ' '.
	selector isUnary
		ifTrue: [ aStream << selector asString ]
		ifFalse: [ selector isBinary
				ifTrue: [ aStream << selector asString << ' ' << (argumentClasses at: 1) asString ]
				ifFalse: [ | keywords |
					keywords := ':' split: selector.
					1 to: keywords size - 1 do: [ :i | aStream << ' ' << (keywords at: i) asString << ': ' << (argumentClasses at: 1) asString ] ] ]
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
CovSend >> resultClass [
	^ resultClass
]

{ #category : #accessing }
CovSend >> resultClass: anObject [
	resultClass := anObject
]

{ #category : #accessing }
CovSend >> selector [
	^ selector
]

{ #category : #accessing }
CovSend >> selector: anObject [
	selector := anObject
]
