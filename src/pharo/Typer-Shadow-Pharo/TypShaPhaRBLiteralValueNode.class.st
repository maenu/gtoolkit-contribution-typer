Class {
	#name : #TypShaPhaRBLiteralValueNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaRBLiteralValueNode class >> ___value: _a [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			{Number typAsType.
			String typAsType} typAsType ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBLiteralValueNode class >> shadowedClass [
	^ RBLiteralValueNode class
]
