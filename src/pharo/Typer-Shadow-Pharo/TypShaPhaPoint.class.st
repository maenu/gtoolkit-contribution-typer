Class {
	#name : #TypShaPhaPoint,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaPoint class >> shadowedClass [
	^ Point class
]

{ #category : #accessing }
TypShaPhaPoint >> ___abs [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Number typAsType ];
		yourself
]
