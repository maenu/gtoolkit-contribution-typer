Class {
	#name : #TypShaPhaRBSequenceNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBSequenceNode class >> shadowedClass [
	^ RBSequenceNode class
]

{ #category : #generated }
TypShaPhaRBSequenceNode >> _statements [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBProgramNode typAsType} ];
		yourself
]
