Class {
	#name : #TypShaPhaRBParser,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaRBParser class >> mParseFaultyMethod: aLookup [ 
	<typShaMethod: 'parseFaultyMethod:'>
	
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBParser class >> shadowedClass [
	^ RBParser class
]
