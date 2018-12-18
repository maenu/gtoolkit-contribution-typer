Class {
	#name : #TypShaPhaRBComment,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaRBComment class >> shadowedClass [
	^ RBComment class
]

{ #category : #accessing }
TypShaPhaRBComment >> ___contents [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | String typAsType ];
		yourself
]
