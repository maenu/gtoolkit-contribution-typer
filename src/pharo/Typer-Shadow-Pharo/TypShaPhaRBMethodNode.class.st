Class {
	#name : #TypShaPhaRBMethodNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode class >> shadowedClass [
	^ RBMethodNode class
]

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode >> _arguments [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBArgumentNode typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode >> _methodClass [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ ClassDescription typAsType ];
		yourself
]
