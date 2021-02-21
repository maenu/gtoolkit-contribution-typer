Class {
	#name : #TypShaPhaRBBlockNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBBlockNode class >> shadowedClass [
	^ RBBlockNode class
]

{ #category : #shadow }
TypShaPhaRBBlockNode >> mArguments: aLookup [ 
	<typShaMethod: 'arguments'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OrderedCollection typAsType
				copyWithParameters: {RBArgumentNode typAsType} ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBBlockNode >> mBody: aLookup [ 
	<typShaMethod: 'body'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBSequenceNode typAsType ];
		yourself
]
