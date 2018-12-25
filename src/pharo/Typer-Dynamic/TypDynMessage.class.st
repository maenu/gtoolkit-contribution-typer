Class {
	#name : #TypDynMessage,
	#superclass : #TypType,
	#instVars : [
		'selector',
		'argumentTypes',
		'receiverType'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #comparing }
TypDynMessage >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypDynMessage".
					selector = object selector
						and: [ argumentTypes = object argumentTypes
								and: [ receiverType = object receiverType ] ] ] ]
]

{ #category : #accessing }
TypDynMessage >> argumentTypes [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ argumentTypes
]

{ #category : #accessing }
TypDynMessage >> argumentTypes: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	argumentTypes := anObject
]

{ #category : #comparing }
TypDynMessage >> hash [
	^ selector hash bitXor: (argumentTypes hash bitXor: receiverType hash)
]

{ #category : #accessing }
TypDynMessage >> initialize [
	<typTypeVariable: 'argumentTypes' as: 'SequenceableCollection<TypType>'>
	<typTypeVariable: 'receiverType' as: 'TypType'>
	<typTypeVariable: 'selector' as: 'Symbol<Character>'>
	super initialize
]

{ #category : #printing }
TypDynMessage >> printOn: aStream [
	receiverType printOn: aStream.
	aStream << ' '.
	selector isUnary
		ifTrue: [ aStream << selector asString ]
		ifFalse: [ selector isBinary
				ifTrue: [ aStream << selector asString << ' ' << (argumentTypes at: 1) printString ]
				ifFalse: [ | keywords |
					keywords := ':' split: selector.
					1 to: keywords size - 1 do: [ :i | aStream << ' ' << (keywords at: i) asString << ': ' << (argumentTypes at: i ifAbsent: [ nil ]) printString ] ] ]
]

{ #category : #accessing }
TypDynMessage >> receiverType [
	<typTypeResultAs: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypDynMessage >> receiverType: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	receiverType := anObject
]

{ #category : #accessing }
TypDynMessage >> selector [
	<typTypeResultAs: 'Symbol<Character>'>
	^ selector
]

{ #category : #accessing }
TypDynMessage >> selector: anObject [
	<typTypeArgument: 1 as: 'Symbol<Character>'>
	selector := anObject
]
