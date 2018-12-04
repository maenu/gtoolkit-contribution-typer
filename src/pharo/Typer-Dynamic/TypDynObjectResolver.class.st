Class {
	#name : #TypDynObjectResolver,
	#superclass : #TypResolver,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #initialization }
TypDynObjectResolver >> initialize [
	<typTypeVariable: 'receiveType' as: 'TypType'>
	<typTypeVariable: 'selector' as: 'Symbol'>
	super initialize
]

{ #category : #accessing }
TypDynObjectResolver >> receiverType [
	<typTypeResultAs: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypDynObjectResolver >> receiverType: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	receiverType := anObject
]

{ #category : #accessing }
TypDynObjectResolver >> selector [
	<typTypeResultAs: 'Symbol'>
	^ selector
]

{ #category : #accessing }
TypDynObjectResolver >> selector: anObject [
	<typTypeArgument: 1 as: 'Symbol'>
	selector := anObject
]
