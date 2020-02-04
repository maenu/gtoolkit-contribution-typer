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
		resultType: [ :a | '@A' typAsTypeVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> ___value [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@B' typAsTypeVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> asType: aClass [
	^ aClass typAsParametricTypeWithParameters: {'@A' . '@B'}
]
