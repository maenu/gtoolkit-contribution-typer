Class {
	#name : #REMOVETypInfSignalsAlwaysVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'signalsAlways',
		'selfType'
	],
	#category : #'Typer-Inference-Flow'
}

{ #category : #accessing }
REMOVETypInfSignalsAlwaysVisitor class >> self: aType [

	^ self new
		  initializeSelf: aType;
		  yourself
]

{ #category : #'as yet unclassified' }
REMOVETypInfSignalsAlwaysVisitor class >> signalsAlwaysOf: aNode self: aType [

	^ (self self: aType)
		  visitNode: aNode;
		  signalsAlways
]

{ #category : #initialization }
REMOVETypInfSignalsAlwaysVisitor >> initialize [
	super initialize.
	signalsAlways := false
]

{ #category : #initialization }
REMOVETypInfSignalsAlwaysVisitor >> initializeSelf: aType [

	selfType := aType
]

{ #category : #accessing }
REMOVETypInfSignalsAlwaysVisitor >> signalsAlways [
	^ signalsAlways
]

{ #category : #visiting }
REMOVETypInfSignalsAlwaysVisitor >> visitBlockNode: aNode [
	"noop"

	
]

{ #category : #visiting }
REMOVETypInfSignalsAlwaysVisitor >> visitMessageNode: aNode [

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
