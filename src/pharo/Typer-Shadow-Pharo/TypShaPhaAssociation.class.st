Class {
	#name : #TypShaPhaAssociation,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaAssociation class >> shadowedClass [
	^ Association class
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> ___key [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType bindingAt: '@A' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> ___value [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType bindingAt: '@B' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> asType: aClass [
	^ aClass typAsParametricType:
			{('@A' -> (TypTypeVariableType named: '@A')).
			('@B' -> (TypTypeVariableType named: '@B'))} asOrderedDictionary
]
