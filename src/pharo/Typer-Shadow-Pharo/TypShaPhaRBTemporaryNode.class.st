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
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBSequenceNode typAsType asNullable
		arguments: {String typAsType}
		argumentsOptional: false
		signalsAlways: false
]
