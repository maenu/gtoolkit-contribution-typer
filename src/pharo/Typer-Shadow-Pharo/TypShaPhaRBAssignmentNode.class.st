Class {
	#name : #TypShaPhaRBAssignmentNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBAssignmentNode class >> shadowedClass [
	^ RBAssignmentNode class
]

{ #category : #accessing }
TypShaPhaRBAssignmentNode >> ___variable [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBVariableNode typAsType ];
		yourself
]
