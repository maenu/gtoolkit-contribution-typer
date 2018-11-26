Class {
	#name : #TypObjectResolver,
	#superclass : #TypResolver,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core'
}

{ #category : #accessing }
TypObjectResolver >> receiverType [
	^ receiverType
]

{ #category : #accessing }
TypObjectResolver >> receiverType: anObject [
	receiverType := anObject
]

{ #category : #accessing }
TypObjectResolver >> selector [
	^ selector
]

{ #category : #accessing }
TypObjectResolver >> selector: anObject [
	selector := anObject
]
