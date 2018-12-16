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
				and: [ nullable = anObject nullable and: [ types asSet = anObject types asSet and: [ weights keys = anObject weights keys ] ] ] ]
]

{ #category : #enumerating }
TypDynUnionType >> add: anAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,Integer>'>
	<typTypeResultAs: 'Integer'>
	| n association |
	association := anAssociation key nullable
		ifTrue: [ n := weights at: TypNilType instance ifAbsentPut: [ 0 ].
			weights at: TypNilType instance put: n + anAssociation value.
			(anAssociation key copy
				nullable: false;
				yourself) -> anAssociation value ]
		ifFalse: [ anAssociation ].
	types add: association key.
	n := weights at: association key ifAbsentPut: [ 0 ].
	^ weights at: association key put: n + association value
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
	<typTypeResultAs: 'Integer'>
	^ (anObject isKindOf: TypDynUnionType)
		ifTrue: [ self addAll: anObject ]
		ifFalse: [ | n type |
			type := anObject nullable
				ifTrue: [ n := weights at: TypNilType instance ifAbsentPut: [ 0 ].
					weights at: TypNilType instance put: n + 1.
					anObject copy
						nullable: false;
						yourself ]
				ifFalse: [ anObject ].
			n := weights at: type ifAbsentPut: [ 0 ].
			weights at: type put: n + 1.
			types add: type ]
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
	<typTypeResultAs: 'TypDynUnionType'>
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
