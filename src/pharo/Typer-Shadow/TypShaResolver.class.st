Class {
	#name : #TypShaResolver,
	#superclass : #TypResolver,
	#instVars : [
		'shadow'
	],
	#category : #'Typer-Shadow-Core'
}

{ #category : #accessing }
TypShaResolver >> shadow [
	^ shadow
]

{ #category : #accessing }
TypShaResolver >> shadow: anObject [
	shadow := anObject
]
