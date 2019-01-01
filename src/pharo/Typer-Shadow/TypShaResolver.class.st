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
	<typTypeResultAs: '{TypShaShadow,TypShaShadow class}'>
	^ shadow
]

{ #category : #accessing }
TypShaResolver >> shadow: anObject [
	<typTypeArgument: 1 as: '{TypShaShadow,TypShaShadow class}'>
	shadow := anObject
]
