Class {
	#name : #TypShaPhaRBVariableNode,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBVariableNode class >> shadowedClass [
	^ RBVariableNode class
]

{ #category : #'as yet unclassified' }
TypShaPhaRBVariableNode >> ___binding [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ OCLiteralVariable typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBVariableNode >> ___isInstance [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaRBVariableNode >> ___name [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
