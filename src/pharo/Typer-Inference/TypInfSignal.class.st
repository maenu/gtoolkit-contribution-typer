Class {
	#name : #TypInfSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'node',
		'message',
		'from',
		'to'
	],
	#category : #'Typer-Inference'
}

{ #category : #'as yet unclassified' }
TypInfSignal class >> emitMessage: aString from: aType to: anotherType node: aNode [

	aType = anotherType ifTrue: [ ^ self ].
	^ self new
		  initializeMessage: aString
		  from: aType
		  to: anotherType
		  node: aNode;
		  emit;
		  yourself
]

{ #category : #initialization }
TypInfSignal >> initializeMessage: aString from: aType to: anotherType node: aNode [

	message := aString.
	from := aType.
	to := anotherType.
	node := aNode
]

{ #category : #accessing }
TypInfSignal >> message [

	^ message
]

{ #category : #printing }
TypInfSignal >> printOn: aStream [

	self printOneLineContentsOn: aStream
]

{ #category : #printing }
TypInfSignal >> printOneLineContentsOn: aStream [

	aStream nextPutAll: message.
	aStream nextPutAll: ' '.
	node printOn: aStream.
	aStream nextPutAll: ' from '.
	from printOn: aStream.
	aStream nextPutAll: ' to '.
	to printOn: aStream
]
