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
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult:
			(SequenceableCollection typAsType
				copyWithParameters: {RBArgumentNode typAsType})
]

{ #category : #shadow }
TypShaPhaRBBlockNode >> mBody: aLookup [
	<typShaMethod: 'body'>
	<typMigrated>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBSequenceNode typAsType
]
