Class {
	#name : #TypCheNoMethodError,
	#superclass : #Error,
	#instVars : [
		'type',
		'selector'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheNoMethodError >> selector [
	^ selector
]

{ #category : #accessing }
TypCheNoMethodError >> selector: anObject [
	selector := anObject
]

{ #category : #accessing }
TypCheNoMethodError >> type [
	^ type
]

{ #category : #accessing }
TypCheNoMethodError >> type: anObject [
	type := anObject
]
