Class {
	#name : #TypShaPhaString,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaString class >> shadowedClass [
	^ String class
]

{ #category : #'as yet unclassified' }
TypShaPhaString >> typShaAsType: aClass [
	^ TypNamedType new
		name: aClass name;
		yourself
]
