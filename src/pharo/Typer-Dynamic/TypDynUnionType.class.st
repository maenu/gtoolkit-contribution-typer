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

{ #category : #accessing }
TypDynUnionType class >> types: aCollection weights: anotherCollection [

	^ (self types: aCollection)
		  initializeWeights: anotherCollection;
		  yourself
]

{ #category : #copying }
TypDynUnionType >> , aType [
	<typPraResult: 'TypDynUnionType'>
	<typPraArguments: 'TypDynUnionType'>
	| copy |
	copy := self copy.
	copy addAll: aType.
	^ copy
]

{ #category : #accessing }
TypDynUnionType >> add: anObject [
	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	weights add: anObject.
	types add: anObject.
	^ anObject
]

{ #category : #enumerating }
TypDynUnionType >> addAll: aTypes [
	<typPraArguments: 'TypDynUnionType'>
	types addAll: aTypes types.
	weights addAll: aTypes weights.
	^ aTypes
]

{ #category : #converting }
TypDynUnionType >> asNonDynType [

	^ self outgoingAt: { #asNonDynType } ifAbsentPut: [ types typAsType ]
]

{ #category : #enumerating }
TypDynUnionType >> collect: aBlock [
	^ self class
		types: (types collect: aBlock)
		weights: (weights collect: aBlock)
]

{ #category : #accessing }
TypDynUnionType >> initialize [
	<typPraVariable: 'weights' as: 'SequenceableCollection<TypType>'>
	super initialize.
	weights := OrderedCollection new	"typParameters TypType"
]

{ #category : #accessing }
TypDynUnionType >> initializeWeights: anotherObject [

	weights := anotherObject
]

{ #category : #'as yet unclassified' }
TypDynUnionType >> postCopy [
	super postCopy.
	weights := weights copy
]

{ #category : #initialization }
TypDynUnionType >> summary [
	<typPraResult: 'OrderedDictionary<TypType,Integer>'>
	^ (((weights groupedBy: #yourself) collect: #size) associations
		sorted: [ :a :b | a value > b value ]) asOrderedDictionary
]

{ #category : #accessing }
TypDynUnionType >> weights [
	<typPraResult: 'SequenceableCollection<TypType>'>
	^ weights copy
]
