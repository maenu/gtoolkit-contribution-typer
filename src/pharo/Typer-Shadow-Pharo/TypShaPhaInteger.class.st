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
TypShaPhaInteger >> ___asCharacter [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Character typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaInteger >> ___atRandom [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]

{ #category : #accessing }
TypShaPhaInteger >> ___bitXor: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | Integer typAsType ];
		resultType: [ :a :s :r | Integer typAsType ];
		yourself
]
