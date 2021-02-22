Class {
	#name : #TypShaPhaRBLiteralArrayNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBLiteralArrayNode class >> shadowedClass [
	^ RBLiteralArrayNode class
]

{ #category : #shadow }
TypShaPhaRBLiteralArrayNode >> mContents: aLookup [
	<typShaMethod: 'contents'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType
				copyWithParameters: {RBLiteralNode typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
