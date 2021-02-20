Class {
	#name : #TypShaPhaRBSequenceNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBSequenceNode class >> shadowedClass [
	^ RBSequenceNode class
]

{ #category : #generated }
TypShaPhaRBSequenceNode >> ___statements [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {RBProgramNode typAsType} ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBSequenceNode >> ___temporaries [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | 
			SequenceableCollection typAsType
				copyWithParameters: {RBTemporaryNode typAsType} ];
		yourself
]
