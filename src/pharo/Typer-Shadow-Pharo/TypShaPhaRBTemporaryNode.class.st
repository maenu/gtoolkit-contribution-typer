Class {
	#name : #TypShaPhaRBTemporaryNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBTemporaryNode class >> shadowedClass [
	^ RBTemporaryNode class
]

{ #category : #accessing }
TypShaPhaRBTemporaryNode >> ___whoDefines: _a [
	^ TypMethodResolver new
		argumentTypes: [ String typAsType ];
		resultType: [ RBSequenceNode typAsType asNullableType ];
		yourself
]
