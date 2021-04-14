Class {
	#name : #TypShaPhaRBReturnNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBReturnNode class >> shadowedClass [
	^ RBReturnNode class
]

{ #category : #shadow }
TypShaPhaRBReturnNode >> mValue: aLookup [
	<typShaMethod: 'value'>
	^ CompiledMethod typAsFunctionTypeWithResult: RBValueNode typAsType
]
