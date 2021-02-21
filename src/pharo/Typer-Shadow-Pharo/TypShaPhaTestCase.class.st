Class {
	#name : #TypShaPhaTestCase,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #shadow }
TypShaPhaTestCase class >> mSuite: aLookup [ 
	<typShaMethod: 'suite'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | TestSuite typAsType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaTestCase class >> shadowedClass [
	^ TestCase class
]
