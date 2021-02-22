Class {
	#name : #TypShaPhaRBSequenceNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBSequenceNode class >> shadowedClass [
	^ RBSequenceNode class
]

{ #category : #shadow }
TypShaPhaRBSequenceNode >> mStatements: aLookup [
	<typShaMethod: 'statements'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(OrderedCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]

{ #category : #shadow }
TypShaPhaRBSequenceNode >> mTemporaries: aLookup [
	<typShaMethod: 'temporaries'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBTemporaryNode typAsType})
		arguments: {}
		argumentsOptional: false
		signalsAlways: false
]
