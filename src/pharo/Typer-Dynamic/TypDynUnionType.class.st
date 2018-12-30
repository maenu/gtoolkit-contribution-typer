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
	aType do: [ :e | copy add: e ].
	^ copy
]

{ #category : #comparing }
TypDynUnionType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypDynUnionType<TypType>".
					nullable = object nullable
						and: [ types asSet = object types asSet
								and: [ weights keys = object weights keys ] ] ] ]
]

{ #category : #enumerating }
TypDynUnionType >> add: anAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,Integer>'>
	<typTypeResultAs: 'Integer'>
	| n |
	types add: anAssociation key.
	n := weights at: anAssociation key ifAbsentPut: [ 0 ].
	^ weights at: anAssociation key put: n + anAssociation value
]

{ #category : #enumerating }
TypDynUnionType >> addAll: aTypes [
	<typTypeArgument: 1 as: 'TypDynUnionType<TypType>'>
	aTypes do: [ :e | self add: e ]
]

{ #category : #enumerating }
TypDynUnionType >> collect: aBlock [
	<typTypeArgument: 1 as: 'BlockClosure(Association<TypType,Integer>)->?'>
	<typTypeResultAs: 'TypDynUnionType<TypType>'>
	| copy |
	copy := TypDynUnionType new.
	self do: [ :e | copy add: (aBlock cull: e) ].
	^ copy
]

{ #category : #enumerating }
TypDynUnionType >> do: aBlock [
	<typTypeArgument: 1 as: 'BlockClosure(Association<TypType,Integer>)->?'>
	weights associationsDo: aBlock
]

{ #category : #comparing }
TypDynUnionType >> hash [
	^ super hash bitXor: weights keys hash
]

{ #category : #accessing }
TypDynUnionType >> increment: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	^ (anObject isKindOf: TypDynUnionType)
		ifTrue: [ self addAll: anObject "typCastAs TypDynUnionType<TypType>" ]
		ifFalse: [ | n |
			n := weights at: anObject ifAbsentPut: [ 0 ].
			weights at: anObject put: n + 1.
			types add: anObject ]
]

{ #category : #accessing }
TypDynUnionType >> initialize [
	<typTypeVariable: 'weights' as: 'Dictionary<TypType,Integer>'>
	super initialize.
	weights := Dictionary new
]

{ #category : #testing }
TypDynUnionType >> isEmpty [
	<typTypeResultAs: 'Boolean'>
	^ weights isEmpty
]

{ #category : #'as yet unclassified' }
TypDynUnionType >> postCopy [
	super postCopy.
	weights := weights copy
]

{ #category : #enumerating }
TypDynUnionType >> select: aBlock [
	<typTypeArgument: 1 as: 'BlockClosure(Association<TypType,Integer>)->Boolean'>
	<typTypeResultAs: 'TypDynUnionType<TypType>'>
	| copy |
	copy := TypDynUnionType new.
	weights
		associationsDo: [ :e | 
			(aBlock cull: e)
				ifTrue: [ copy add: e ] ].
	^ copy
]

{ #category : #initialization }
TypDynUnionType >> summary [
	<typTypeResultAs: 'OrderedDictionary<TypType,Integer>'>
	| summary |
	summary := weights associations copy.
	summary sort: [ :a :b | a value > b value ].
	^ summary asOrderedDictionary
]

{ #category : #accessing }
TypDynUnionType >> typGtItemsFor: aView [
	<typTypeArgument: 1 as: 'GtPhlowView'>
	<typTypeResultAs: 'GtPhlowView'>
	<gtView>
	^ self summary gtItemsFor: aView
]

{ #category : #accessing }
TypDynUnionType >> weights [
	<typTypeResultAs: 'Dictionary<TypType,Integer>'>
	^ weights
]

{ #category : #accessing }
TypDynUnionType >> weights: anObject [
	<typTypeArgument: 1 as: 'Dictionary<TypType,Integer>'>
	weights := anObject
]
