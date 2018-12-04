Class {
	#name : #TypShaPhaRBArrayNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBArrayNode class >> shadowedClass [
	^ RBArrayNode class
]

{ #category : #generated }
TypShaPhaRBArrayNode >> _statements [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBProgramNode typAsType} ];
		yourself
]
