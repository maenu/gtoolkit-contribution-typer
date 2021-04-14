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
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBSequenceNode >> mTemporaries: aLookup [
	<typShaMethod: 'temporaries'>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBTemporaryNode typAsType})
]
