Class {
	#name : #TypPraExaNonParametricClass,
	#superclass : #TypPraExaParametricSubclass,
	#category : #'Typer-Pragma-Examples'
}

{ #category : #initialization }
TypPraExaNonParametricClass >> initialize [
	<typPraSuperTypeBind: '@B' to: 'Boolean'>
	super initialize
]
