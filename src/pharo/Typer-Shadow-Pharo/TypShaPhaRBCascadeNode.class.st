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
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBMessageNode typAsType} ];
		yourself
]
