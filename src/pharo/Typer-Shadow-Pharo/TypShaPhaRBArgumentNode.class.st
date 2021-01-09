Class {
	#name : #TypShaPhaRBArgumentNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBArgumentNode class >> shadowedClass [
	^ RBArgumentNode class
]

{ #category : #accessing }
TypShaPhaRBArgumentNode >> ___whoDefines: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ String typAsType ];
		resultType: [ {RBMethodNode typAsType.
			RBBlockNode typAsType} typAsType asNullable ];
		yourself
]
