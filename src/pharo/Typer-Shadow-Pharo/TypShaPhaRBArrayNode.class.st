Class {
	#name : #TypShaPhaRBArrayNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBArrayNode class >> shadowedClass [
	^ RBArrayNode class
]

{ #category : #generated }
TypShaPhaRBArrayNode >> ___statements [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {('@A' -> RBProgramNode typAsType)} asDictionary ];
		yourself
]
