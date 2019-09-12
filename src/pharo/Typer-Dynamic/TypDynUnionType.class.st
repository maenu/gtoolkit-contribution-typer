Class {
	#name : #TypDynUnionType,
	#superclass : #TypUnionType,
	#instVars : [
		'weights'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #copying }
TypDynUnionType >> , aType [
	<typTypeArgument: 1 as: 'TypDynUnionType<TypType>'>
	<typTypeResultAs: 'TypDynUnionType<TypType>'>
	| copy |
	copy := self copy.
	copy addAll: aType.
	^ copy
]

{ #category : #accessing }
TypDynUnionType >> add: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	weights add: anObject.
	types add: anObject.
	^ anObject
]

{ #category : #enumerating }
TypDynUnionType >> addAll: aTypes [
	<typTypeArgument: 1 as: 'TypDynUnionType<TypType>'>
	types addAll: aTypes types.
	weights addAll: aTypes weights.
	^ aTypes
]

{ #category : #converting }
TypDynUnionType >> asNonDynType [
	^ nullable
		ifTrue: [ types typAsType asNullableType ]
		ifFalse: [ types typAsType ]
]

{ #category : #enumerating }
TypDynUnionType >> collect: aBlock [
	^ self class new
		types: (types collect: aBlock);
		weights: (weights collect: aBlock);
		yourself
]

{ #category : #accessing }
TypDynUnionType >> initialize [
	<typTypeVariable: 'weights' as: 'SequenceableCollection<TypType>'>
	super initialize.
	weights := OrderedCollection new "typParameters TypType"
]

{ #category : #'as yet unclassified' }
TypDynUnionType >> postCopy [
	super postCopy.
	weights := weights copy
]

{ #category : #initialization }
TypDynUnionType >> summary [
	<typTypeResultAs: 'OrderedDictionary<TypType,Integer>'>
	^ (((weights groupedBy: #yourself) collect: #size) associations
		sorted: [ :a :b | a value > b value ]) asOrderedDictionary
]

{ #category : #accessing }
TypDynUnionType >> weights [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ weights
]

{ #category : #accessing }
TypDynUnionType >> weights: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	weights := anObject
]
