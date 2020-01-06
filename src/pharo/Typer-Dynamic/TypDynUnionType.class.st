Class {
	#name : #TypDynUnionType,
	#superclass : #TypUnionType,
	#instVars : [
		'weights'
	],
	#category : #'Typer-Dynamic'
}

{ #category : #'as yet unclassified' }
TypDynUnionType class >> types: aCollection [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
TypDynUnionType class >> types: aCollection weights: anotherCollection [
	^ self new
		initializeTypes: (self asTypes: aCollection) weights: anotherCollection;
		yourself
]

{ #category : #copying }
TypDynUnionType >> , aType [
	<typTypeArgument: 1 as: 'TypDynUnionType'>
	<typTypeResultAs: 'TypDynUnionType'>
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
	<typTypeArgument: 1 as: 'TypDynUnionType'>
	types addAll: aTypes types.
	weights addAll: aTypes weights.
	^ aTypes
]

{ #category : #converting }
TypDynUnionType >> asNonDynType [
	^ types typAsType
]

{ #category : #enumerating }
TypDynUnionType >> collect: aBlock [
	^ self class
		types: (types collect: aBlock)
		weights: (weights collect: aBlock)
]

{ #category : #accessing }
TypDynUnionType >> initialize [
	<typTypeVariable: 'weights' as: 'SequenceableCollection<TypType>'>
	super initialize.
	weights := OrderedCollection new "typParameters TypType"
]

{ #category : #accessing }
TypDynUnionType >> initializeTypes: anObject weights: anotherObject [
	<typTypeArgument: 2 as: 'SequenceableCollection<TypType>'>
	super initializeTypes: anObject.
	weights := anotherObject
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
	^ weights copy
]
