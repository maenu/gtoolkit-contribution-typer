Class {
	#name : #TypShaPhaRBVariableNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBVariableNode class >> shadowedClass [
	^ RBVariableNode class
]

{ #category : #shadow }
TypShaPhaRBVariableNode >> mBinding: aLookup [ 
	<typShaMethod: 'binding'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OCLiteralVariable typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBVariableNode >> mIsInstance: aLookup [ 
	<typShaMethod: 'isInstance'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBVariableNode >> mName: aLookup [ 
	<typShaMethod: 'name'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
