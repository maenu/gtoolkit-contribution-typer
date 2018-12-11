Class {
	#name : #TypShaPhaRBParser,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaRBParser class >> ___parseFaultyMethod: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | String typAsType ];
		resultType: [ :a :s :r | RBMethodNode typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBParser class >> shadowedClass [
	^ RBParser class
]
