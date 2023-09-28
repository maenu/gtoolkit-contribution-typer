Class {
	#name : #TypCheNoMethodError,
	#superclass : #TypCheError,
	#instVars : [
		'type',
		'selector'
	],
	#category : #'Typer-Checker-Core'
}

{ #category : #accessing }
TypCheNoMethodError >> color [
	^ Color orange darker
]

{ #category : #accessing }
TypCheNoMethodError >> selector [
	<typPraResult: 'Symbol'>
	^ selector
]

{ #category : #accessing }
TypCheNoMethodError >> selector: anObject [
	<typPraArguments: 'Symbol'>
	selector := anObject
]

{ #category : #accessing }
TypCheNoMethodError >> type [
	<typPraResult: 'TypType'>
	^ type
]

{ #category : #accessing }
TypCheNoMethodError >> type: anObject [
	<typPraArguments: 'TypType'>
	type := anObject
]
