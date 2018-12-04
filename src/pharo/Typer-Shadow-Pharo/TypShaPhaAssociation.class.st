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
TypShaPhaAssociation >> _key [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 1 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> _value [
	^ TypMethodResolver new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | a receiverType parameters at: 2 ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> typShaAsType: aClass [
	^ TypParametricType new
		type: aClass typAsNamedType;
		parameters:
			{TypUnknownType instance.
			TypUnknownType instance};
		yourself
]
