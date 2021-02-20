Class {
	#name : #TypShaPhaForm,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaForm class >> shadowedClass [
	^ Form class
]

{ #category : #accessing }
TypShaPhaForm >> ___asElement [
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | BlElement typAsType ];
		yourself
]
