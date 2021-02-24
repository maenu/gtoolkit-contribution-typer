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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: OCLiteralVariable typAsType
]

{ #category : #shadow }
TypShaPhaRBVariableNode >> mIsInstance: aLookup [
	<typShaMethod: 'isInstance'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Boolean typAsType
]

{ #category : #shadow }
TypShaPhaRBVariableNode >> mName: aLookup [
	<typShaMethod: 'name'>
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: String typAsType
]
