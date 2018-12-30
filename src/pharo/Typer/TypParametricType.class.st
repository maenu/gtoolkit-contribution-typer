Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'parameters'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypParametricType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypParametricType".
					self nullable = object nullable
						and: [ self name = object name
								and: [ self parameters = object parameters ] ] ] ]
]

{ #category : #comparing }
TypParametricType >> > aType [
	^ self ~= aType
		and: [ aType isParametric
				ifTrue: [ | type_ |
					type_ := aType 	"typCastAs TypParametricType".
					self asNamedType >= type_ asNamedType
						and: [ parameters size = type_ parameters size and: [ (parameters withIndexSelect: [ :e :i | e >= (type_ parameters at: i) ]) size = parameters size ] ] ]
				ifFalse: [ super > aType ] ]
]

{ #category : #accessing }
TypParametricType >> asCompatibleType: aType [
	self flag: 'not sure...'.
	(aType isParametric and: [ aType parameters size = parameters size ])
		ifFalse: [ ^ super asCompatibleType: aType ].
	^ TypParametricType new
		name: (self asNamedType asCompatibleType: aType asNamedType) name;
		parameters: (parameters size timesCollect: [ :i | (parameters at: i) asCompatibleType: (aType parameters at: i) ]);
		yourself
]

{ #category : #converting }
TypParametricType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	TypNoTypeError signal
]

{ #category : #testing }
TypParametricType >> asNamedType [
	^ TypNamedType new
		name: name;
		nullable: nullable;
		yourself
]

{ #category : #testing }
TypParametricType >> asParametricType: someTypes [
	| copy |
	someTypes size == parameters size
		ifFalse: [ TypNoTypeError signal ].
	copy := self copy.
	someTypes withIndexDo: [ :e :i | copy parameters at: i put: e ].
	^ copy
]

{ #category : #comparing }
TypParametricType >> hash [
	^ super hash bitXor: parameters hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	<typTypeVariable: 'type' as: 'TypType'>
	<typTypeVariable: 'parameters' as: 'OrderedCollection<TypType>'>
	super initialize.
	parameters := OrderedCollection new "typParameters TypType"
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
]

{ #category : #accessing }
TypParametricType >> parameters [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ parameters
]

{ #category : #accessing }
TypParametricType >> parameters: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	parameters := anObject asOrderedCollection
]

{ #category : #copying }
TypParametricType >> postCopy [
	super postCopy.
	parameters := parameters collect: #copy
]

{ #category : #printing }
TypParametricType >> printOn: aStream [
	super printOn: aStream.
	aStream << '<'.
	1 to: parameters size do: [ :i | 
		(parameters at: i) printOn: aStream.
		i < parameters size
			ifTrue: [ aStream << ',' ] ].
	aStream << '>'
]
