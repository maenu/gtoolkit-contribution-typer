Class {
	#name : #TypShaPhaRBPragmaNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaRBPragmaNode class >> mSelectorArguments: aLookup [
	<typShaMethod: 'selector:arguments:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBPragmaNode typAsType
		arguments:
			{Symbol typAsType.
			(SequenceableCollection typAsType
				copyWithParameters: {RBLiteralValueNode typAsType})}
]

{ #category : #'as yet unclassified' }
TypShaPhaRBPragmaNode class >> shadowedClass [
	^ RBPragmaNode class
]

{ #category : #shadow }
TypShaPhaRBPragmaNode >> mSelector: aLookup [
	<typShaMethod: 'selector'>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
