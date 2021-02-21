Class {
	#name : #TypShaPhaRBArrayNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBArrayNode class >> shadowedClass [
	^ RBArrayNode class
]

{ #category : #shadow }
TypShaPhaRBArrayNode >> mStatements: aLookup [ 
	<typShaMethod: 'statements'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {RBProgramNode typAsType} ];
		yourself
]
