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
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]

{ #category : #shadow }
TypShaPhaRBAssignmentNode >> mVariable: aLookup [
	<typShaMethod: 'variable'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBVariableNode typAsType
]
