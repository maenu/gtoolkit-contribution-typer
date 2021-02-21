Class {
	#name : #TypShaPhaRBAssignmentNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBAssignmentNode class >> shadowedClass [
	^ RBAssignmentNode class
]

{ #category : #shadow }
TypShaPhaRBAssignmentNode >> mValue: aLookup [ 
	<typShaMethod: 'value'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBValueNode typAsType ];
		yourself
]

{ #category : #shadow }
TypShaPhaRBAssignmentNode >> mVariable: aLookup [ 
	<typShaMethod: 'variable'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | RBVariableNode typAsType ];
		yourself
]
