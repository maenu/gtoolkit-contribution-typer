Class {
	#name : #TypShaPhaInteger,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaInteger class >> shadowedClass [
	^ Integer class
]

{ #category : #accessing }
TypShaPhaInteger >> ___bitXor: _a [
	^ TypMethodResolver new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]
