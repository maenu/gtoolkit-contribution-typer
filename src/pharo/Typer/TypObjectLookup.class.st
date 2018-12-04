Class {
	#name : #TypObjectLookup,
	#superclass : #TypLookup,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core'
}

{ #category : #copying }
TypObjectLookup >> copyWithSuperType [
	self assert: [ self hasSuperType ].
	^ self copy
		receiverType: receiverType superType;
		yourself
]

{ #category : #testing }
TypObjectLookup >> hasSuperType [
	^ receiverType hasSuperType
]

{ #category : #initialization }
TypObjectLookup >> initialize [
	<typTypeVariable: 'receiverType' as: 'TypType'>
	<typTypeVariable: 'selector' as:  'Symbol'>
	super initialize
]

{ #category : #accessing }
TypObjectLookup >> receiverType [
	<typTypeResultAs: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypObjectLookup >> receiverType: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	receiverType := anObject
]

{ #category : #accessing }
TypObjectLookup >> selector [
	<typTypeResultAs:  'Symbol'>
	^ selector
]

{ #category : #accessing }
TypObjectLookup >> selector: anObject [
	<typTypeArgument: 1 as:  'Symbol'>
	selector := anObject
]