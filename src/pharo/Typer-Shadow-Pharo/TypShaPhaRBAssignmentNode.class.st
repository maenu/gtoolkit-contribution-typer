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
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #shadow }
TypShaPhaRBAssignmentNode >> mVariable: aLookup [
	<typShaMethod: 'variable'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBVariableNode typAsType
]
