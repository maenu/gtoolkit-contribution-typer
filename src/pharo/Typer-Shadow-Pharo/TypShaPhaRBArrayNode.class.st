Class {
	#name : #TypShaPhaRBArrayNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBArrayNode class >> shadowedClass [
	^ RBArrayNode class
]

{ #category : #generated }
TypShaPhaRBArrayNode >> ___statements [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBProgramNode typAsType} ];
		yourself
]
