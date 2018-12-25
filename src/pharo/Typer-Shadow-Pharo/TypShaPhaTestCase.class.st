Class {
	#name : #TypShaPhaTestCase,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaTestCase class >> ___suite [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | TestSuite typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaTestCase class >> shadowedClass [
	^ TestCase class
]
