Class {
	#name : #TypShaPhaException,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #accessing }
TypShaPhaException class >> ___signal [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a :s :r | a receiverType classDescription instanceSide typAsType ];
		signalsAlways: [ true ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaException class >> shadowedClass [
	^ Exception class
]
