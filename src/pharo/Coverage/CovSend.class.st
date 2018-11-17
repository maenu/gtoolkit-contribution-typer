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

{ #category : #accessing }
CovSend >> argumentClasses [
	^ argumentClasses
]

{ #category : #accessing }
CovSend >> argumentClasses: anObject [
	argumentClasses := anObject
]

{ #category : #printing }
CovSend >> printOn: aStream [
	receiverClass printOn: aStream.
	aStream << ' '.
	selector isUnary
		ifTrue: [ selector printOn: aStream ]
		ifFalse: [ selector isBinary
				ifTrue: [ selector printOn: aStream.
					aStream << ' '.
					(argumentClasses at: 1) printOn: aStream ]
				ifFalse: [ | keywords |
					keywords := selector separateKeywords.
					1 to: keywords size do: [ :i | 
						(keywords at: i) printOn: aStream.
						aStream << ' '.
						(argumentClasses at: i) printOn: aStream ] ] ]
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
