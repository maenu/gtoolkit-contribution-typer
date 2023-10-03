Class {
	#name : #TypPraExaParametricSubclass,
	#superclass : #TypPraExaParametricClass,
	#category : #'Typer-Pragma-Examples'
}

{ #category : #initialization }
TypPraExaParametricSubclass >> initialize [
	<typPraSuperTypeBind: #A to: 'Integer'>
	<typPraParameters: #B>
	super initialize
]

{ #category : #'as yet unclassified' }
TypPraExaParametricSubclass >> some: arg1 [
	^ y
]
