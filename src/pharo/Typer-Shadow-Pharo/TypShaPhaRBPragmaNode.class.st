Class {
	#name : #TypShaPhaRBPragmaNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaRBPragmaNode class >> ___selector: _a arguments: _b [
	^ TypMethodLookupResult new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Symbol typAsType ]
				ifFalse: [ SequenceableCollection typAsType
						copyWithBindings: {('@A' typAsType -> RBLiteralValueNode typAsType)} typAsTypeVariableBindings ] ];
		resultType: [ :a :s :r | RBPragmaNode typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBPragmaNode class >> shadowedClass [
	^ RBPragmaNode class
]

{ #category : #accessing }
TypShaPhaRBPragmaNode >> ___selector [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
