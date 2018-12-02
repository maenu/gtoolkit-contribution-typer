Class {
	#name : #TypObjectResolver,
	#superclass : #TypResolver,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core'
}

{ #category : #initialization }
TypObjectResolver >> initialize [
	<typTypeVariable: 'receiveType' as: 'TypType'>
	<typTypeVariable: 'selector' as: 'Symbol'>
	super initialize
]

{ #category : #accessing }
TypObjectResolver >> receiverType [
	<typTypeResultAs: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypObjectResolver >> receiverType: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	receiverType := anObject
]

{ #category : #accessing }
TypObjectResolver >> selector [
	<typTypeResultAs: 'Symbol'>
	^ selector
]

{ #category : #accessing }
TypObjectResolver >> selector: anObject [
	<typTypeArgument: 1 as: 'Symbol'>
	selector := anObject
]
