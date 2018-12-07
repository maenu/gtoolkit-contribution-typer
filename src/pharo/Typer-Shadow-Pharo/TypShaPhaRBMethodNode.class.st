Class {
	#name : #TypShaPhaRBMethodNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBMethodNode class >> shadowedClass [
	^ RBMethodNode class
]

{ #category : #accessing }
TypShaPhaRBMethodNode >> _allChildren [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				asParametricType: {RBProgramNode typAsType} ];
		yourself
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
