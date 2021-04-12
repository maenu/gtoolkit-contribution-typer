Class {
	#name : #TypPraExaParametricSubclass,
	#superclass : #TypPraExaParametricClass,
	#category : #'Typer-Pragma-Examples'
}

{ #category : #initialization }
TypPraExaParametricSubclass >> initialize [
	<typTypeParameters: '@B'>
	<typSuperTypeBind: '@A' to: 'Integer'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypPraExaParametricSubclass >> some: arg1 [
	^ y
]
