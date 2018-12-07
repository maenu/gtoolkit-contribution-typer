Class {
	#name : #TypShaPhaCharacter,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo-Core'
}

{ #category : #'as yet unclassified' }
TypShaPhaCharacter class >> shadowedClass [
	^ Character class
]

{ #category : #accessing }
TypShaPhaCharacter >> _isUppercase [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | Boolean typAsType ];
		yourself
]
