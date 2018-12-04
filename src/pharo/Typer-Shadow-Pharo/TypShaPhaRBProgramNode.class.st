Class {
	#name : #TypShaPhaRBProgramNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode class >> shadowedClass [
	^ RBProgramNode class
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> _assignmentNodes [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBAssignmentNode typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> _comments [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType asParametricType: {RBComment typAsType} ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> _methodNode [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ RBMethodNode typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBProgramNode >> _whoDefines: _a [
	^ TypMethodResolver new
		argumentTypes: [ String typAsType ];
		resultType: [ RBProgramNode typAsType copy
				nullable: true;
				yourself ];
		yourself
]
