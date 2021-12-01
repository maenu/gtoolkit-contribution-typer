Class {
	#name : #TypInfSignalsAlwaysVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'signalsAlways',
		'context'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfSignalsAlwaysVisitor class >> context: aContext [

	^ self new
		  initializeContext: aContext;
		  yourself
]

{ #category : #'as yet unclassified' }
TypInfSignalsAlwaysVisitor class >> signalsAlwaysOf: aNode in: aContext [

	^ (self context: aContext)
		  visitNode: aNode;
		  signalsAlways
]

{ #category : #initialization }
TypInfSignalsAlwaysVisitor >> initialize [
	super initialize.
	signalsAlways := false
]

{ #category : #initialization }
TypInfSignalsAlwaysVisitor >> initializeContext: aContext [

	context := aContext
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
	method := aNode typInfMethodIn: context.
	s := method isFunction
		     ifTrue: [ method signalsAlways ]
		     ifFalse: [ nil ].
	s = true ifTrue: [ signalsAlways := true ].
	s = nil ifTrue: [ 
		signalsAlways = false ifTrue: [ signalsAlways := nil ] ]
]
