Class {
	#name : #TypShaPhaRBVariableNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBVariableNode class >> shadowedClass [
	^ RBVariableNode class
]

{ #category : #'as yet unclassified' }
TypShaPhaRBVariableNode >> _binding [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OCLiteralVariable typAsType ];
		yourself
]
