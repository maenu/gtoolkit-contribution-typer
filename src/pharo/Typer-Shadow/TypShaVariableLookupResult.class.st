Class {
	#name : #TypShaVariableLookupResult,
	#superclass : #TypVariableLookupResult,
	#instVars : [
		'shadow'
	],
	#category : #'Typer-Shadow-Lookup'
}

{ #category : #accessing }
TypShaVariableLookupResult class >> shadow: anObject [
	^ self new
		initializeShadow: anObject;
		yourself
]

{ #category : #accessing }
TypShaVariableLookupResult >> initializeShadow: anObject [
	shadow := anObject
]

{ #category : #accessing }
TypShaVariableLookupResult >> type [
	shadow class instVarNames
		detect: [ :e | e = ('___' , lookup selector asString) ]
		ifFound: [ :e | ^ shadow instVarNamed: e ]
		ifNone: [ TypNoTypeError signal ]
]
