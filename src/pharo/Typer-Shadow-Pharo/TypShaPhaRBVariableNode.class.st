Class {
	#name : #TypShaPhaRBVariableNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
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

{ #category : #accessing }
TypShaPhaRBVariableNode >> _name [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
