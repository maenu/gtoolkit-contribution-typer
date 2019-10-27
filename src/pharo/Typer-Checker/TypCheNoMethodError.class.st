Class {
	#name : #TypCheNoMethodError,
	#superclass : #Error,
	#instVars : [
		'type',
		'selector'
	],
	#category : #'Typer-Checker'
}

{ #category : #accessing }
TypCheNoMethodError >> selector [
	<typTypeResultAs: 'Symbol'>
	^ selector
]

{ #category : #accessing }
TypCheNoMethodError >> selector: anObject [
	<typTypeArgument: 1 as: 'Symbol'>
	selector := anObject
]

{ #category : #accessing }
TypCheNoMethodError >> type [
	<typTypeResultAs: 'TypType'>
	^ type
]

{ #category : #accessing }
TypCheNoMethodError >> type: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	type := anObject
]
