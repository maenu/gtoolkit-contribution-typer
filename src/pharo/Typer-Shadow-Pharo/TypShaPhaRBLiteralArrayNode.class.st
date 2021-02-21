Class {
	#name : #TypShaPhaRBLiteralArrayNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBLiteralArrayNode class >> shadowedClass [
	^ RBLiteralArrayNode class
]

{ #category : #shadow }
TypShaPhaRBLiteralArrayNode >> mContents: aLookup [ 
	<typShaMethod: 'contents'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {RBLiteralNode typAsType} ];
		yourself
]
