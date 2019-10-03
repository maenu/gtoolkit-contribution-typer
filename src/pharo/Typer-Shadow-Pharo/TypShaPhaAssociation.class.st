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
		resultType: [ :a | a receiverType bindings at: '@A' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> ___value [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType bindings at: '@B' ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> asType: aClass [
	^ (super asType: aClass)
		asParametricType:
			{('@A' -> (TypTypeVariableType named: '@A')).
			('@B' -> (TypTypeVariableType named: '@B'))} asOrderedDictionary
]
