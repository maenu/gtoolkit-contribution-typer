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
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> ___value [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> asType: aClass [
	^ aClass typAsNamedType
		asParametricType:
			{(TypTypeVariableType named: '@A').
			(TypTypeVariableType named: '@B')}
]
