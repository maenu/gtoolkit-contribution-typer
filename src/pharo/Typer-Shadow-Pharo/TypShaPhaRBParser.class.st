Class {
	#name : #TypShaPhaRBParser,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaRBParser class >> mParseFaultyMethod: aLookup [
	<typShaMethod: 'parseFaultyMethod:'>
	^ CompiledMethod
		typAsFunctionTypeWithResult: RBMethodNode typAsType
		arguments: {String typAsType}
]

{ #category : #'as yet unclassified' }
TypShaPhaRBParser class >> shadowedClass [
	^ RBParser class
]
