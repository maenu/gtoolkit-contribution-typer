Class {
	#name : #TypShaPhaRBCascadeNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBCascadeNode class >> shadowedClass [
	^ RBCascadeNode class
]

{ #category : #accessing }
TypShaPhaRBCascadeNode >> ___messages [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | SequenceableCollection typAsType asParametricType: {RBMessageNode typAsType} ];
		yourself
]
