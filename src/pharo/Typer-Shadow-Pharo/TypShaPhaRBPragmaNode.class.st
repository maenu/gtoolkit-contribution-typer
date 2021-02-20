Class {
	#name : #TypShaPhaRBPragmaNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaRBPragmaNode class >> ___selector: _a arguments: _b [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | 
			i = 1
				ifTrue: [ Symbol typAsType ]
				ifFalse: [ SequenceableCollection typAsType
						copyWithParameters: {RBLiteralValueNode typAsType} ] ];
		resultType: [ :a :s :r | RBPragmaNode typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaRBPragmaNode class >> shadowedClass [
	^ RBPragmaNode class
]

{ #category : #accessing }
TypShaPhaRBPragmaNode >> ___selector [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Symbol typAsType ];
		yourself
]
