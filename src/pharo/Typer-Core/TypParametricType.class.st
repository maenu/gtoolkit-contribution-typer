Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'parameters'
	],
	#category : #'Typer-Core-Type'
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
	^ aType isParametric
		and: [ super > aType
				and: [ | type_ |
					type_ := aType "typCastAs TypParametricType".
					parameters size = type_ parameters size
						and: [ (parameters withIndexSelect: [ :e :i | e >= (type_ parameters at: i) ]) size = parameters size ] ] ]
]

{ #category : #accessing }
TypParametricType >> asTypeCompatibleWith: aType [
	| compatibleType |
	compatibleType := ((TypNamedType named: name)
		nullable: nullable;
		yourself)
		asTypeCompatibleWith:
			(aType isNamed
				ifTrue: [ (TypNamedType named: (aType "typCastAs TypNamedType") name)
						nullable: aType nullable;
						yourself ]
				ifFalse: [ aType ]).
	(compatibleType isNamed and: [ aType isParametric and: [ (aType "typCastAs TypParametricType") parameters size = parameters size ] ])
		ifFalse: [ ^ compatibleType ].
	^ TypParametricType new
		nullable: compatibleType nullable;
		name: (compatibleType "typCastAs TypNamedType") name;
		parameters: (parameters size timesCollect: [ :i | (parameters at: i) asTypeCompatibleWith: ((aType "typCastAs TypParametricType") parameters at: i) ]);
		yourself
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

{ #category : #accessing }
TypParametricType >> superType [
	| superType |
	superType := super superType.
	(superType isParametric and: [ (superType "typCastAs TypParametricType") parameters size = parameters size ])
		ifTrue: [ superType := (superType "typCastAs TypParametricType") copy
				parameters: parameters copy;
				yourself ].
	^ superType
]
