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
					self name = object name and: [ self parameters = object parameters ] ] ]
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

{ #category : #generated }
TypParametricType >> allVariables [
	^ self variables
		, ((parameters select: #isParametric) flatCollect: #allVariables)
]

{ #category : #accessing }
TypParametricType >> asTypeCompatibleWith: aType [
	| compatibleType |
	compatibleType := ((TypNamedType named: name)
		yourself)
		asTypeCompatibleWith:
			(aType isNamed
				ifTrue: [ TypNamedType named: (aType "typCastAs TypNamedType") name]
				ifFalse: [ aType ]).
	(compatibleType isNamed and: [ aType isParametric and: [ (aType "typCastAs TypParametricType") parameters size = parameters size ] ])
		ifFalse: [ ^ compatibleType ].
	^ TypParametricType new
		name: (compatibleType "typCastAs TypNamedType") name;
		parameters: (parameters size timesCollect: [ :i | (parameters at: i) asTypeCompatibleWith: ((aType "typCastAs TypParametricType") parameters at: i) ]);
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricType >> ensureNoVariables [
	self allVariables
		do: [ :e | self replaceVariable: e with: TypUnknownType instance ]
]

{ #category : #'as yet unclassified' }
TypParametricType >> ensureNoVariablesClashingWith: aCollection [
	| variables intersection union |
	variables := self allVariables.
	intersection := (variables intersection: aCollection) copy.
	union := (variables , aCollection) copy.
	[ intersection isEmpty ]
		whileFalse: [ | old new |
			old := intersection remove: intersection anyOne.
			new := TypVariableType
				named:
					((union
						inject: 0
						into: [ :m :e | e name asInteger ifNil: [ m ] ifNotNil: [ :f | m max: f ] ])
						+ 1) asString.
			union add: new.
			self replaceVariable: old with: new ]
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

{ #category : #'as yet unclassified' }
TypParametricType >> replaceVariable: aVariable with: aType [
	parameters
		withIndexDo: [ :e :i | 
			e = aVariable
				ifTrue: [ parameters at: i put: aType ]
				ifFalse: [ e isParametric
						ifTrue: [ e replaceVariable: aVariable with: aType ] ] ]
]

{ #category : #accessing }
TypParametricType >> superType [
	| superType |
	superType := super superType.
	^ (superType isParametric
		and:
			[ (superType "typCastAs TypParametricType") parameters size = parameters size ])
		ifTrue: [ (superType "typCastAs TypParametricType") copy
				parameters: parameters copy;
				yourself ]
		ifFalse: [ superType ]
]

{ #category : #generated }
TypParametricType >> variables [
	^ (parameters select: #isVariable) asSet
]
