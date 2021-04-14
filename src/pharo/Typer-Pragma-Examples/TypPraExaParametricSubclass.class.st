Class {
	#name : #TypPraExaParametricSubclass,
	#superclass : #TypPraExaParametricClass,
	#category : #'Typer-Pragma-Examples'
}

{ #category : #initialization }
TypPraExaParametricSubclass >> initialize [
	<typPraParameters: '@B'>
	<typPraSuperTypeBind: '@A' to: 'Integer'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypPraExaParametricSubclass >> some: arg1 [
	^ y
]
