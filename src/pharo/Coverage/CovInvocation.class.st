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
	receiverClass printOn: aStream.
	aStream << ' '.
	method selector isUnary
		ifTrue: [ method selector printOn: aStream ]
		ifFalse: [ method selector isBinary
				ifTrue: [ method selector printOn: aStream.
					aStream << ' '.
					(argumentClasses at: 1) printOn: aStream ]
				ifFalse: [ | keywords |
					keywords := method selector separateKeywords.
					1 to: keywords size do: [ :i | 
						(keywords at: i) printOn: aStream.
						aStream << ' '.
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
