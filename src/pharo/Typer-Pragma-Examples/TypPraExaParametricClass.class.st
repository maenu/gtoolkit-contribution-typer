Class {
	#name : #TypPraExaParametricClass,
	#superclass : #Object,
	#instVars : [
		'x',
		'y'
	],
	#category : #'Typer-Pragma-Examples'
}

{ #category : #initialization }
TypPraExaParametricClass >> initialize [

	<typPraParameters: '#A,#B'>
	<typPraVariable: #x as: #A>
	<typPraVariable: #y as: #B>
	super initialize
]

{ #category : #'as yet unclassified' }
TypPraExaParametricClass >> some: arg1 [

	<typPraResult: #B>
	<typPraArguments: #A>
	self subclassResponsibility
]
