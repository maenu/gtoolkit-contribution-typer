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
	^ CompiledMethod
		typAsFunctionTypeWithResult: OCLiteralVariable typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaRBVariableNode >> mIsInstance: aLookup [
	<typShaMethod: 'isInstance'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: Boolean typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaRBVariableNode >> mName: aLookup [
	<typShaMethod: 'name'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: String typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
