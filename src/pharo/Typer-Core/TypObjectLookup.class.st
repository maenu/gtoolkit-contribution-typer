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
	<typTypeVariable: 'selector' as: 'Symbol'>
	<typTypeVariable: 'receiverType' as: 'TypType'>
	super initialize
]

{ #category : #printing }
TypObjectLookup >> printOn: aStream [
	super printOn: aStream.
	aStream nextPutAll: ' '.
	receiverType printOn: aStream.
	aStream nextPutAll: ' >> '.
	aStream nextPutAll: selector.
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
