Class {
	#name : #TypObjectLookup,
	#superclass : #TypLookup,
	#instVars : [
		'selector',
		'receiverType'
	],
	#category : #'Typer-Core-Lookup'
}

{ #category : #comparing }
TypObjectLookup >> = anObject [
	^ self == anObject
		or: [ self class == anObject class
				and: [ | object |
					object := anObject "typCastAs TypObjectLookup".
					selector = object selector
						and: [ receiverType = object receiverType ] ] ]
]

{ #category : #copying }
TypObjectLookup >> adaptWithSuperType [
	self assert: [ self hasSuperType ].
	self receiverType: receiverType superType
]

{ #category : #testing }
TypObjectLookup >> hasSuperType [
	^ receiverType hasSuperType
]

{ #category : #comparing }
TypObjectLookup >> hash [
	^ selector hash bitXor: receiverType hash
]

{ #category : #initialization }
TypObjectLookup >> initialize [
	<typTypeVariable: 'receiverType' as: 'TypType'>
	<typTypeVariable: 'selector' as:  'Symbol<Character>'>
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
	<typTypeResultAs:  'Symbol<Character>'>
	^ selector
]

{ #category : #accessing }
TypObjectLookup >> selector: anObject [
	<typTypeArgument: 1 as:  'Symbol<Character>'>
	selector := anObject
]
