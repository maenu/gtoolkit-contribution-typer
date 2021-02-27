Class {
	#name : #TypShaPhaRBPragmaNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaRBPragmaNode class >> mSelectorArguments: aLookup [
	<typShaMethod: 'selector:arguments:'>
	<typMigrated>
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
	<typMigrated>
	^ CompiledMethod typAsFunctionTypeWithResult: Symbol typAsType
]
