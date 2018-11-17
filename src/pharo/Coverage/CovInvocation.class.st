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

{ #category : #accessing }
CovInvocation >> argumentClasses [
	^ argumentClasses
]

{ #category : #accessing }
CovInvocation >> argumentClasses: anObject [
	argumentClasses := anObject
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
		ifTrue: [ selector printOn: aStream ]
		ifFalse: [ selector isBinary
				ifTrue: [ selector printOn: aStream.
					aStream << ' '.
					(argumentClasses at: 1) printOn: aStream ]
				ifFalse: [ | keywords |
					keywords := ':' split: selector.
					1 to: keywords size - 1 do: [ :i | 
						aStream << ' '.
						(keywords at: i) printOn: aStream.
						aStream << ': '.
						(argumentClasses at: i) printOn: aStream ] ] ]
]

{ #category : #accessing }
CovInvocation >> receiverClass [
	^ receiverClass
]

{ #category : #accessing }
CovInvocation >> receiverClass: anObject [
	receiverClass := anObject
]
