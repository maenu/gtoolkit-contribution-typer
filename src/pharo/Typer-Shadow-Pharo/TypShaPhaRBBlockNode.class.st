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
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType
				copyWithParameters: {RBArgumentNode typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaRBBlockNode >> mBody: aLookup [
	<typShaMethod: 'body'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBSequenceNode typAsType
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
