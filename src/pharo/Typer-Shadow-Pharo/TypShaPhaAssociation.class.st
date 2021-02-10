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
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #'as yet unclassified' }
TypShaPhaAssociation >> ___value [
	^ TypMethodLookupResult new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@B' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #accessing }
TypShaPhaAssociation >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters:
			{('@A' -> '@A' typAsVariableType).
			('@B' -> '@B' typAsVariableType)} asOrderedDictionary
]
