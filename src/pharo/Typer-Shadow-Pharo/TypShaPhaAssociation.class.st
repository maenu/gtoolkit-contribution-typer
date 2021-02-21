Class {
	#name : #TypShaPhaAssociation,
	#superclass : #TypShaShadow,
	#category : #'Typer-Shadow-Pharo'
}

{ #category : #'as yet unclassified' }
TypShaPhaAssociation class >> shadowedClass [
	^ Association class
]

{ #category : #accessing }
TypShaPhaAssociation >> asType: aClass [
	^ aClass
		typAsParametricTypeWithParameters:
			{('@A' -> '@A' typAsVariableType).
			('@B' -> '@B' typAsVariableType)} asOrderedDictionary
]

{ #category : #shadow }
TypShaPhaAssociation >> mKey: aLookup [ 
	<typShaMethod: 'key'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@A' typAsVariableType resolveIn: a receiverType ];
		yourself
]

{ #category : #shadow }
TypShaPhaAssociation >> mValue: aLookup [ 
	<typShaMethod: 'value'>
	
	^ TypFunctionType new
		argumentTypes: [ TypNoTypeError signal ];
		resultType: [ :a | '@B' typAsVariableType resolveIn: a receiverType ];
		yourself
]
