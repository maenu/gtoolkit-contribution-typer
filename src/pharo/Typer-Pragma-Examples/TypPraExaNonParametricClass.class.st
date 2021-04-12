Class {
	#name : #TypPraExaNonParametricClass,
	#superclass : #TypPraExaParametricSubclass,
	#category : #'Typer-Pragma-Examples'
}

{ #category : #initialization }
TypPraExaNonParametricClass >> initialize [
	<typSuperTypeBind: '@B' to: 'Boolean'>
	super initialize
]
