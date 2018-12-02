Class {
	#name : #TypLookup,
	#superclass : #Object,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core'
}

{ #category : #copying }
TypLookup >> copyWithSuperType [
	<typTypeResultAs: 'TypLookup'>
	^ self copy
		receiverType: receiverType superType;
		yourself
]

{ #category : #initialization }
TypLookup >> initialize [
	<typTypeVariable: 'receiverType' as: 'TypType'>
	<typTypeVariable: 'selector' as:  'Symbol'>
	super initialize
]

{ #category : #accessing }
TypLookup >> receiverType [
	<typTypeResultAs: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypLookup >> receiverType: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	receiverType := anObject
]

{ #category : #accessing }
TypLookup >> selector [
	<typTypeResultAs:  'Symbol'>
	^ selector
]

{ #category : #accessing }
TypLookup >> selector: anObject [
	<typTypeArgument: 1 as:  'Symbol'>
	selector := anObject
]
