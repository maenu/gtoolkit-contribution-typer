Class {
	#name : 'TypInfSignalsAlwaysVisitor',
	#superclass : 'RBProgramNodeVisitor',
	#instVars : [
		'signalsAlways'
	],
	#category : 'Typer-Inference'
}

{ #category : 'initialization' }
TypInfSignalsAlwaysVisitor >> initialize [
	super initialize.
	signalsAlways := false
]

{ #category : 'accessing' }
TypInfSignalsAlwaysVisitor >> signalsAlways [
	^ signalsAlways
]

{ #category : 'visiting' }
TypInfSignalsAlwaysVisitor >> visitBlockNode: aNode [
	"noop"

	
]

{ #category : 'visiting' }
TypInfSignalsAlwaysVisitor >> visitMessageNode: aNode [
	| method s |
	super visitMessageNode: aNode.
	method := aNode typInfMethod.
	s := method isFunction
		ifTrue: [ method signalsAlways ]
		ifFalse: [ nil ].
	s = true
		ifTrue: [ signalsAlways := true ].
	s = nil
		ifTrue: [ signalsAlways = false
				ifTrue: [ signalsAlways := nil ] ]
]
