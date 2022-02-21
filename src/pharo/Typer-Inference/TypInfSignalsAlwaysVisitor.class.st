Class {
	#name : #TypInfSignalsAlwaysVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'signalsAlways',
		'selfType'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfSignalsAlwaysVisitor class >> self: aType [

	^ self new
		  initializeSelf: aType;
		  yourself
]

{ #category : #'as yet unclassified' }
TypInfSignalsAlwaysVisitor class >> signalsAlwaysOf: aNode self: aType [

	^ (self self: aType)
		  visitNode: aNode;
		  signalsAlways
]

{ #category : #initialization }
TypInfSignalsAlwaysVisitor >> initialize [
	super initialize.
	signalsAlways := false
]

{ #category : #initialization }
TypInfSignalsAlwaysVisitor >> initializeSelf: aType [

	selfType := aType
]

{ #category : #accessing }
TypInfSignalsAlwaysVisitor >> signalsAlways [
	^ signalsAlways
]

{ #category : #visiting }
TypInfSignalsAlwaysVisitor >> visitBlockNode: aNode [
	"noop"

	
]

{ #category : #visiting }
TypInfSignalsAlwaysVisitor >> visitMessageNode: aNode [

	| method s |
	super visitMessageNode: aNode.
	method := aNode typInfMethodIn: selfType.
	s := method isFunction
		     ifTrue: [ method signalsAlways ]
		     ifFalse: [ nil ].
	s = true ifTrue: [ signalsAlways := true ].
	s = nil ifTrue: [ 
		signalsAlways = false ifTrue: [ signalsAlways := nil ] ]
]
