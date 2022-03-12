Class {
	#name : #TypInfSignal,
	#superclass : #BeaconSignal,
	#instVars : [
		'node',
		'from',
		'by',
		'to'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfSignal class >> emitNode: aNode from: aType by: anotherType to: yetAnotherType [

	^ self new
		  initializeNode: aNode
		  from: aType
		  by: anotherType
		  to: yetAnotherType;
		  emit;
		  yourself
]

{ #category : #initialization }
TypInfSignal >> initializeNode: aNode from: aType by: anotherType to: yetAnotherType [

	node := aNode.
	from := aType.
	by := anotherType.
	to := yetAnotherType
]

{ #category : #printing }
TypInfSignal >> printOn: aStream [

	self printOneLineContentsOn: aStream
]

{ #category : #printing }
TypInfSignal >> printOneLineContentsOn: aStream [

	node printOn: aStream.
	aStream nextPutAll: ' '.
	from printOn: aStream.
	aStream nextPutAll: ' '.
	by printOn: aStream.
	aStream nextPutAll: ' '.
	to printOn: aStream.
	aStream nextPutAll: ' '
]
