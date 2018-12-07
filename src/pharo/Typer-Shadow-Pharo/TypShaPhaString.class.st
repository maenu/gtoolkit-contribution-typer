Class {
	#name : #TypShaPhaString,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaString class >> shadowedClass [
	^ String class
]

{ #category : #converting }
TypShaPhaString >> asType: aClass [
	^ aClass typAsNamedType asParametricType: {Character typAsType}
]
