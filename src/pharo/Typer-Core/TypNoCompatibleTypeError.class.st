Class {
	#name : #TypNoCompatibleTypeError,
	#superclass : #Error,
	#instVars : [
		'cause'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypNoCompatibleTypeError >> cause [
	<typTypeResultAs: 'Error'>
	^ cause
]

{ #category : #accessing }
TypNoCompatibleTypeError >> cause: anObject [
	<typTypeArgument: 1 as: 'Error'>
	cause := anObject
]

{ #category : #initialization }
TypNoCompatibleTypeError >> initialize [
	<typTypeVariable: 'cause' as: 'Error'>
	super initialize
]
