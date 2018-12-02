Class {
	#name : #TypUnionType,
	#superclass : #TypType,
	#instVars : [
		'weights'
	],
	#category : #'Typer-Core'
}

{ #category : #'as yet unclassified' }
TypUnionType class >> typAsType [
	^ TypParametricType new
		type: super typAsType asNonParametricType;
		parameters: {TypType typAsType};
		yourself
]

{ #category : #copying }
TypUnionType >> , aType [
	<typTypeArgument: 1 as: 'TypUnionType<TypType>'>
	<typTypeResultAs: 'TypUnionType<TypType>'>
	| copy |
	copy := self copy.
	aType do: [ :e | copy add: e ].
	^ copy
]

{ #category : #comparing }
TypUnionType >> = anObject [
	^ self == anObject or: [ self class = anObject class and: [ nullable = anObject nullable and: [ weights = anObject weights ] ] ]
]

{ #category : #enumerating }
TypUnionType >> add: anAssociation [
	<typTypeArgument: 1 as: 'Association<TypType,Integer>'>
	<typTypeResultAs: 'Integer'>
	| n |
	n := weights at: anAssociation key ifAbsentPut: [ 0 ].
	^ weights at: anAssociation key put: n + anAssociation value
]

{ #category : #enumerating }
TypUnionType >> addAll: aTypes [
	<typTypeArgument: 1 as: 'TypUnionType<TypType>'>
	aTypes do: [ :e | self add: e ]
]

{ #category : #converting }
TypUnionType >> asClass [
	^ self superType asClass
]

{ #category : #converting }
TypUnionType >> asParametricType: someTypes [
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
TypUnionType >> asType [
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
TypUnionType >> canBeParametricType [
	^ true
]

{ #category : #enumerating }
TypUnionType >> collect: aBlock [
	<typTypeArgument: 1 as: 'BlockClosure<Association<TypType,Integer>,?>'>
	<typTypeResultAs: 'TypUnionType<TypType>'>
	| copy |
	copy := TypUnionType new.
	self do: [ :e | copy add: (aBlock cull: e) ].
	^ copy
]

{ #category : #enumerating }
TypUnionType >> do: aBlock [
	<typTypeArgument: 1 as: 'BlockClosure<Association<TypType,Integer>,?>'>
	weights associationsDo: aBlock
]

{ #category : #testing }
TypUnionType >> hasClass [
	^ self superType hasClass
]

{ #category : #comparing }
TypUnionType >> hash [
	^ super hash bitXor: weights keys asSet hash
]

{ #category : #accessing }
TypUnionType >> increment: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Integer'>
	^ (anObject isKindOf: TypUnionType)
		ifTrue: [ self addAll: anObject ]
		ifFalse: [ | n |
			n := weights at: anObject ifAbsentPut: [ 0 ].
			weights at: anObject put: n + 1 ]
]

{ #category : #accessing }
TypUnionType >> initialize [
	<typTypeVariable: 'weights' as: 'Dictionary<TypType,Integer>'>
	super initialize.
	weights := Dictionary new
]

{ #category : #testing }
TypUnionType >> isEmpty [
	<typTypeResultAs: 'Boolean'>
	^ weights isEmpty
]

{ #category : #testing }
TypUnionType >> isUnion [
	^ true
]

{ #category : #generated }
TypUnionType >> parameters [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	| keys size parameters |
	keys := weights keys asSet.
	size := (keys
		collect: [ :e | 
			e isParametric
				ifTrue: [ e parameters size ]
				ifFalse: [ 0 ] ]) max.
	parameters := (size timesCollect: [ TypUnionType new ]) "typParameters TypType".
	keys
		do: [ :e | 
			e isParametric
				ifTrue: [ e "typCastAs TypParametricType" parameters withIndexDo: [ :f :i | (parameters at: i) increment: f ] ] ].
	^ parameters collect: #asType
]

{ #category : #'as yet unclassified' }
TypUnionType >> postCopy [
	super postCopy.
	weights := weights copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream [
	super printOn: aStream.
	aStream << 'U ' << self superType printString
]

{ #category : #enumerating }
TypUnionType >> select: aBlock [
	<typTypeArgument: 1 as: 'BlockClosure<Association<TypType,Integer>,Boolean>'>
	<typTypeResultAs: 'TypUnionType'>
	| copy |
	copy := TypUnionType new.
	weights
		associationsDo: [ :e | 
			(aBlock cull: e)
				ifTrue: [ copy add: e ] ].
	^ copy
]

{ #category : #accessing }
TypUnionType >> size [
	<typTypeResultAs: 'Integer'>
	^ weights isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ weights sum ]
]

{ #category : #initialization }
TypUnionType >> summary [
	<typTypeResultAs: 'OrderedDictionary<TypType,Integer>'>
	| summary |
	summary := weights associations copy.
	summary sort: [ :a :b | a value > b value ].
	^ summary asOrderedDictionary
]

{ #category : #accessing }
TypUnionType >> superType [
	| remains nullable_ current |
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
TypUnionType >> typGtItemsFor: aView [
	<typTypeArgument: 1 as: 'GtPhlowView'>
	<typTypeResultAs: 'GtPhlowView'>
	<gtView>
	^ self summary gtItemsFor: aView
]

{ #category : #accessing }
TypUnionType >> weights [
	<typTypeResultAs: 'Dictionary<TypType,Integer>'>
	^ weights
]

{ #category : #accessing }
TypUnionType >> weights: anObject [
	<typTypeArgument: 1 as: 'Dictionary<TypType,Integer>'>
	weights := anObject
]
