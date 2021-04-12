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
	<typTypeParameters: '@A,@B'>
	<typTypeVariable: #x as: '@A'>
	<typTypeVariable: #y as: '@B'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypPraExaParametricClass >> some: arg1 [
	<typTypeArgument: 1 as: '@A'>
	<typTypeResultAs: '@B'>
	self subclassResponsibility
]
