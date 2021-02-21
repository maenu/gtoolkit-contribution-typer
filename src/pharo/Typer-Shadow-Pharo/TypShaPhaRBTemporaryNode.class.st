Class {
	#name : #TypShaPhaRBTemporaryNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBTemporaryNode class >> shadowedClass [
	^ RBTemporaryNode class
]

{ #category : #shadow }
TypShaPhaRBTemporaryNode >> mWhoDefines: aLookup [ 
	<typShaMethod: 'whoDefines:'>
	
	^ TypFunctionType new
		argumentTypes: [ String typAsType ];
		resultType: [ RBSequenceNode typAsType asNullable ];
		yourself
]
