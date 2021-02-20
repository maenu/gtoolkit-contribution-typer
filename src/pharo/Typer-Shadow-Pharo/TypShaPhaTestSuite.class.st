Class {
	#name : #TypShaPhaTestSuite,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaTestSuite class >> shadowedClass [
	^ TestSuite class
]

{ #category : #accessing }
TypShaPhaTestSuite >> ___run: _a [
	^ TypFunctionType new
		argumentTypes: [ :i :a :s :r | TestResult typAsType ];
		resultType: [ :a :s :r | a receiverType ];
		yourself
]
