Class {
	#name : #TypDynUnionType,
	#superclass : #TypType,
	#instVars : [
		'weights'
	],
	#category : #'Typer-Dynamic-Core'
}

{ #category : #copying }
TypDynUnionType >> , aType [
	<typTypeArgument: 1 as: 'TypUnionType<TypType>'>
	<typTypeResultAs: 'TypUnionType<TypType>'>
	| copy |
	copy := self copy.
	aType do: [ :e | copy add: e ].
	^ copy
]

{ #category : #comparing }
TypDynUnionType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ weights = anObject weights ] ] ]
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
	n := weights at: association key ifAbsentPut: [ 0 ].
	^ weights at: association key put: n + association value
]

{ #category : #enumerating }
TypDynUnionType >> addAll: aTypes [
	<typTypeArgument: 1 as: 'TypUnionType<TypType>'>
	aTypes do: [ :e | self add: e ]
]

{ #category : #converting }
TypDynUnionType >> asClass [
	^ self superType asClass
]

{ #category : #converting }
TypDynUnionType >> asParametricType: someTypes [
	| type |
	type := self copy.
	type weights removeAll.
	weights associations
		do: [ :e | 
			| f |
			f := e key.
			f canBeParametricType
				ifTrue: [ f := f asParametricType: someTypes ].
			type weights at: f put: e value ].
	^ type
]

{ #category : #accessing }
TypDynUnionType >> asSourceString [
	^ super asSourceString , self superType asSourceString
]

{ #category : #accessing }
TypDynUnionType >> asType [
	<typTypeResultAs: 'TypType'>
	| remains current nullable_ |
	(weights includesKey: TypUnknownType instance)
		ifTrue: [ ^ self ].
	remains := weights keys asSet copy.
	nullable_ := remains includes: TypNilType instance.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypNilType instance ].
	remains size = 1
		ifTrue: [ current := remains anyOne.
			nullable_
				ifTrue: [ current := current copy.
					current nullable: true ].
			^ current ].
	^ self
]

{ #category : #converting }
TypDynUnionType >> canBeParametricType [
	^ true
]

{ #category : #enumerating }
TypDynUnionType >> collect: aBlock [
	<typTypeArgument: 1 as: 'BlockClosure(Association<TypType,Integer>)->?'>
	<typTypeResultAs: 'TypUnionType<TypType>'>
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

{ #category : #testing }
TypDynUnionType >> hasClass [
	^ self superType hasClass
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
			weights at: type put: n + 1 ]
]

{ #category : #accessing }
TypDynUnionType >> initialize [
	<typTypeParametersAs: 'TypType'>
	<typTypeVariable: 'weights' as: 'Dictionary<TypType,Integer>'>
	super initialize.
	weights := Dictionary new
]

{ #category : #testing }
TypDynUnionType >> isEmpty [
	<typTypeResultAs: 'Boolean'>
	^ weights isEmpty
]

{ #category : #converting }
TypDynUnionType >> isParametric [
	^ self superType isParametric
]

{ #category : #testing }
TypDynUnionType >> isUnion [
	^ true
]

{ #category : #accessing }
TypDynUnionType >> nullable [
	^ weights includesKey: TypNilType instance
]

{ #category : #accessing }
TypDynUnionType >> nullable: aBoolean [
	aBoolean
		ifTrue: [ self increment: TypNilType instance ]
		ifFalse: [ weights removeKey: TypNilType instance ifAbsent: [  ] ]
]

{ #category : #converting }
TypDynUnionType >> parameters [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ self superType parameters
]

{ #category : #'as yet unclassified' }
TypDynUnionType >> postCopy [
	super postCopy.
	weights := weights copy
]

{ #category : #printing }
TypDynUnionType >> printOn: aStream [
	super printOn: aStream.
	aStream << 'U ' << self superType printString
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

{ #category : #accessing }
TypDynUnionType >> size [
	<typTypeResultAs: 'Integer'>
	^ weights isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ weights sum ]
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
TypDynUnionType >> superType [
	| remains nullable_ current |
	self assert: [ self hasSuperType ].
	remains := weights keys asSet copy.
	remains remove: TypUnknownType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypUnknownType instance ].
	nullable_ := remains includes: TypNilType instance.
	remains remove: TypNilType instance ifAbsent: [  ].
	remains ifEmpty: [ ^ TypNilType instance ].
	current := remains anyOne.
	remains remove: current.
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains anyOne.
			remains remove: next.
			common := current withAllSuperTypes detect: [ :e | next <= e ].
			common == current
				ifFalse: [ current := common.
					remains add: current ] ].
	nullable_
		ifTrue: [ current := current copy.
			current nullable: true ].
	^ current
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
