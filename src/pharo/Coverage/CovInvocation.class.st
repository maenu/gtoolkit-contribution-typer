Class {
	#name : #CovInvocation,
	#superclass : #Object,
	#instVars : [
		'method',
		'receiverClass',
		'argumentClasses'
	],
	#category : #Coverage
}

{ #category : #comparing }
CovInvocation >> = anObject [
	^ super = anObject
		and: [ self class = anObject class
				and: [ method = anObject method and: [ argumentClasses = anObject argumentClasses and: [ receiverClass = anObject receiverClass ] ] ] ]
]

{ #category : #accessing }
CovInvocation >> argumentClasses [
	^ argumentClasses
]

{ #category : #accessing }
CovInvocation >> argumentClasses: anObject [
	argumentClasses := anObject
]

{ #category : #comparing }
CovInvocation >> hash [
	^ method hash + argumentClasses hash + receiverClass hash
]

{ #category : #accessing }
CovInvocation >> method [
	^ method
]

{ #category : #accessing }
CovInvocation >> method: anObject [
	method := anObject
]

{ #category : #printing }
CovInvocation >> printOn: aStream [
	| selector |
	receiverClass printOn: aStream.
	aStream << ' '.
	selector := method selector.
	selector isUnary
		ifTrue: [ aStream << selector asString ]
		ifFalse: [ selector isBinary
				ifTrue: [ aStream << selector asString << ' ' << (argumentClasses at: 1) name ]
				ifFalse: [ | keywords |
					keywords := ':' split: selector.
					1 to: keywords size - 1 do: [ :i | aStream << ' ' << (keywords at: i) asString << ': ' << (argumentClasses at: 1) name ] ] ]
]

{ #category : #accessing }
CovInvocation >> receiverClass [
	^ receiverClass
]

{ #category : #accessing }
CovInvocation >> receiverClass: anObject [
	receiverClass := anObject
]
