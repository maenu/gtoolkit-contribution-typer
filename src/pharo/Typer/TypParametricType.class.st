Class {
	#name : #TypParametricType,
	#superclass : #TypType,
	#instVars : [
		'type',
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
					nullable = object nullable
						and: [ type = object type
								and: [ parameters asOrderedCollection
										= object parameters asOrderedCollection ] ] ] ]
]

{ #category : #converting }
TypParametricType >> asClass [
	^ type asClass
]

{ #category : #converting }
TypParametricType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	TypNoTypeError signal
]

{ #category : #testing }
TypParametricType >> asNonParametricType [
	^ type asNonParametricType
]

{ #category : #testing }
TypParametricType >> asParametricType: someTypes [
	| copy parameters_ |
	copy := self copy.
	parameters_ := (OrderedCollection ofSize: (parameters size max: someTypes size)) "typParameters TypType".
	parameters withIndexDo: [ :e :i | parameters_ at: i put: e ].
	someTypes withIndexDo: [ :e :i | parameters_ at: i put: e ].
	copy parameters: parameters_.
	^ copy
]

{ #category : #accessing }
TypParametricType >> asSourceString [
	^ type asSourceString , '<' , (',' join: (parameters collect: #asSourceString)) , '>'
]

{ #category : #comparing }
TypParametricType >> canBeParametricType [
	^ true
]

{ #category : #'as yet unclassified' }
TypParametricType >> compatibleWith: aType [
	| compatibleType compatibleParameters |
	compatibleType := type compatibleWith: aType.
	(aType isParametric not or: [ parameters size ~= aType parameters size ])
		ifTrue: [ ^ compatibleType ].
	compatibleParameters := parameters size timesCollect: [ :i | (parameters at: i) compatibleWith: (aType parameters at: i) ].
	^ TypParametricType new
		type: compatibleType;
		parameters: compatibleParameters;
		yourself
]

{ #category : #converting }
TypParametricType >> hasClass [
	^ type hasClass
]

{ #category : #testing }
TypParametricType >> hasSuperType [
	^ (parameters anySatisfy: [ :e | e isUnion ]) or: [ type hasSuperType ]
]

{ #category : #comparing }
TypParametricType >> hash [
	^ (super hash bitXor: type hash) bitXor: parameters asOrderedCollection hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	<typTypeVariable: 'type' as: 'TypType'>
	<typTypeVariable: 'parameters' as: 'SequenceableCollection<TypType>'>
	super initialize.
	parameters := OrderedCollection new "typParameters TypType"
]

{ #category : #comparing }
TypParametricType >> isCompatibleWith: aType [
	^ (aType isKindOf: TypParametricType)
		ifTrue: [ | type_ |
			type_ := aType "typCastAs TypParametricType".
			type >= type_ type
				and: [ parameters size = type_ parameters size
						and: [ (parameters
								withIndexSelect: [ :e :i | e >= (type_ parameters at: i) ])
								size = parameters size ] ] ]
		ifFalse: [ super isCompatibleWith: aType ]
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
]

{ #category : #accessing }
TypParametricType >> nullable [
	^ type nullable
]

{ #category : #accessing }
TypParametricType >> nullable: anObject [
	type nullable: anObject
]

{ #category : #accessing }
TypParametricType >> parameters [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ parameters
]

{ #category : #accessing }
TypParametricType >> parameters: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	parameters := anObject
]

{ #category : #copying }
TypParametricType >> postCopy [
	super postCopy.
	type := type copy.
	parameters := parameters collect: #copy
]

{ #category : #printing }
TypParametricType >> printOn: aStream [
	type printOn: aStream.
	aStream << '<'.
	aStream << (',' join: (parameters collect: #printString)).
	aStream << '>'
]

{ #category : #accessing }
TypParametricType >> superType [
	self assert: [ self hasSuperType ].
	^ (parameters anySatisfy: [ :e | e isUnion ])
		ifTrue: [ self copy
				parameters:
					(parameters
						collect: [ :e | 
							e isUnion
								ifTrue: [ e superType ]
								ifFalse: [ e ] ]);
				yourself ]
		ifFalse: [ | superType |
			superType := type superType.
			(superType isParametric and: [ parameters size = (superType "typCastAs TypParametricType") parameters size ])
				ifTrue: [ self copy
						type: superType asNonParametricType;
						yourself ]
				ifFalse: [ superType ] ]
]

{ #category : #accessing }
TypParametricType >> type [
	<typTypeResultAs: 'TypType'>
	^ type
]

{ #category : #accessing }
TypParametricType >> type: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	type := anObject
]
