Class {
	#name : #TypDynMessage,
	#superclass : #TypType,
	#instVars : [
		'selector',
		'argumentTypes',
		'receiverType'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #comparing }
TypDynMessage >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypDynMessage".
					selector = object selector
						and: [ argumentTypes = object argumentTypes
								and: [ receiverType = object receiver ] ] ] ]
]

{ #category : #accessing }
TypDynMessage >> argumentTypes [
	<typPraResult: 'SequenceableCollection<TypType>'>
	^ argumentTypes
]

{ #category : #accessing }
TypDynMessage >> argumentTypes: anObject [
	<typPraArguments: 'SequenceableCollection<TypType>'>
	argumentTypes := anObject
]

{ #category : #comparing }
TypDynMessage >> hash [
	^ hash
		ifNil: [ hash := selector hash
				bitXor: (argumentTypes hash bitXor: receiverType hash) ]
]

{ #category : #accessing }
TypDynMessage >> initialize [
	<typPraVariable: 'argumentTypes' as: 'SequenceableCollection<TypType>'>
	<typPraVariable: 'receiverType' as: 'TypType'>
	<typPraVariable: 'selector' as: 'Symbol'>
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
TypDynMessage >> receiver [
	<typPraResult: 'TypType'>
	^ receiverType
]

{ #category : #accessing }
TypDynMessage >> receiverType: anObject [
	<typPraArguments: 'TypType'>
	receiverType := anObject
]

{ #category : #accessing }
TypDynMessage >> selector [
	<typPraResult: 'Symbol'>
	^ selector
]

{ #category : #accessing }
TypDynMessage >> selector: anObject [
	<typPraArguments: 'Symbol'>
	selector := anObject
]
