Class {
	#name : #TypPraExaParametricSubclass,
	#superclass : #TypPraExaParametricClass,
	#category : #'Typer-Pragma-Examples'
}

{ #category : #initialization }
TypPraExaParametricSubclass >> initialize [
	<typParameters: '@B'>
	<typBind: '@A' to: 'Integer'>
	super initialize
]

{ #category : #'as yet unclassified' }
TypPraExaParametricSubclass >> some: arg1 [
	^ y
]
