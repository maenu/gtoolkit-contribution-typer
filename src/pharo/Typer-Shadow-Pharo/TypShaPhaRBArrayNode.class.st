Class {
	#name : #TypShaPhaRBArrayNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBArrayNode class >> shadowedClass [
	^ RBArrayNode class
]

{ #category : #shadow }
TypShaPhaRBArrayNode >> mStatements: aLookup [
	<typShaMethod: 'statements'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBProgramNode typAsType})
]
