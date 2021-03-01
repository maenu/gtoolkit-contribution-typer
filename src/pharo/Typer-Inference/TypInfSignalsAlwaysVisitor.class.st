Class {
	#name : #TypInfSignalsAlwaysVisitor,
	#superclass : #RBProgramNodeVisitor,
	#instVars : [
		'signalsAlways'
	],
	#category : #'Typer-Inference'
}

{ #category : #initialization }
TypInfSignalsAlwaysVisitor >> initialize [
	super initialize.
	signalsAlways := false
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
	| s |
	super visitMessageNode: aNode.
	s := aNode typInfMethod signalsAlways.
	s = true
		ifTrue: [ signalsAlways := true ].
	s = nil
		ifTrue: [ signalsAlways = false
				ifTrue: [ signalsAlways = nil ] ]
]
