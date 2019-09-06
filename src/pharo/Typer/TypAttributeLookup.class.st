Class {
	#name : #TypAttributeLookup,
	#superclass : #TypLookup,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypAttributeLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ | object |
					object := anObject "typCastAs TypObjectLookup".
					selector = object selector
						and: [ receiverType = object receiverType ] ] ]
]

{ #category : #copying }
TypAttributeLookup >> adaptWithSuperType [
	self assert: [ self hasSuperType ].
	self receiverType: receiverType superType
]

{ #category : #testing }
TypAttributeLookup >> hasSuperType [
	^ receiverType hasSuperType
]

{ #category : #comparing }
TypAttributeLookup >> hash [
	^ selector hash bitXor: receiverType hash
]

{ #category : #initialization }
TypAttributeLookup >> initialize [
	<typTypeVariable: 'receiverType' as: 'TypType'>
	<typTypeVariable: 'selector' as:  'Symbol<Character>'>
	super initialize
]

{ #category : #accessing }
TypAttributeLookup >> receiverType [
	<typTypeResultAs: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypAttributeLookup >> receiverType: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	receiverType := anObject
]

{ #category : #accessing }
TypAttributeLookup >> selector [
	<typTypeResultAs:  'Symbol<Character>'>
	^ selector
]

{ #category : #accessing }
TypAttributeLookup >> selector: anObject [
	<typTypeArgument: 1 as:  'Symbol<Character>'>
	selector := anObject
]
