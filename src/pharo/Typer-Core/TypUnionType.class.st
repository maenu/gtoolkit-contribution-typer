Class {
	#name : #TypUnionType,
	#superclass : #TypType,
	#instVars : [
		'types'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #converting }
TypUnionType class >> asTypes: aCollection [
	| remains nil_ |
	remains := (aCollection
		flatCollect: [ :e "typParameters TypType"
			 | 
			e isUnion
				ifTrue: [ e "typCastAs TypUnionType" types ]
				ifFalse: [ {e} ] ]) asSet.
	nil_ := (remains includes: TypNilType instance).
	nil_ ifTrue: [ remains remove: TypNilType instance ].
	remains := remains
		reject: [ :e | 
			(remains
				copyWithoutAll:
					{e.
					TypUnknownType instance}) anySatisfy: [ :f | f >= e ] ].
	nil_ ifTrue: [ remains add: TypNilType instance ].
	^ remains
]

{ #category : #generated }
TypUnionType class >> types: aCollection [
	^ self new
		initializeWithTypes: (self asTypes: aCollection);
		yourself
]

{ #category : #comparing }
TypUnionType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypUnionType".
					self types = object types ] ]
]

{ #category : #comparing }
TypUnionType >> > aType [
	^ self ~= aType
		and: [ aType isUnion
				ifTrue: [ (aType "typCastAs TypUnionType") types allSatisfy: [ :e | self >= e ] ]
				ifFalse: [ types anySatisfy: [ :e | e >= aType ] ] ]
]

{ #category : #converting }
TypUnionType >> asNonNullableType [
	^ (types includes: TypNilType instance)
		ifTrue: [ (types copyWithout: TypNilType instance) typAsType ]
		ifFalse: [ self ]
]

{ #category : #'as yet unclassified' }
TypUnionType >> canUnderstand: aSymbol [
	^ types allSatisfy: [ :e | e canUnderstand: aSymbol ]
]

{ #category : #testing }
TypUnionType >> hasSuperType [
	superType
		ifNil: [ | remains nil_ unknown current |
			remains := types copy.
			nil_ := remains includes: TypNilType instance.
			nil_
				ifTrue: [ remains remove: TypNilType instance ].
			unknown := remains includes: TypUnknownType instance.
			unknown
				ifTrue: [ remains remove: TypUnknownType instance ].
			remains ifEmpty: [ ^ self ].
			current := remains remove: remains anyOne.
			[ remains isEmpty ]
				whileFalse: [ | next common |
					next := remains remove: remains anyOne.
					common := current asTypeCompatibleWith: next.
					common isNil
						ifTrue: [ nil_ := true ]
						ifFalse: [ common isUnknown
								ifTrue: [ unknown := true ]
								ifFalse: [ common = current
										ifFalse: [ current := common.
											remains add: current ] ] ] ].
			remains := Set with: current.
			nil_
				ifTrue: [ remains add: TypNilType instance ].
			unknown
				ifTrue: [ remains add: TypUnknownType instance ].
			superType := remains typAsType ].
	^ superType ~= self
]

{ #category : #comparing }
TypUnionType >> hash [
	^ types hash
]

{ #category : #accessing }
TypUnionType >> initialize [
	<typTypeVariable: 'types' as: 'Set<TypType>'>
	super initialize.
]

{ #category : #accessing }
TypUnionType >> initializeWithTypes: anObject [
	<typTypeArgument: 1 as: 'Set<TypType>'>
	self
		assert: [ | types_ |
			types_ := self class asTypes: anObject.
			types_ size > 1 and: [ types_ = anObject ] ].
	types := anObject
]

{ #category : #converting }
TypUnionType >> isFunction [
	| superType |
	self flag: 'FIXME ignore ? and ! for this'.
	superType := self superType.
	^ superType isUnion
		ifTrue: [ false ]
		ifFalse: [ superType isFunction ]
]

{ #category : #converting }
TypUnionType >> isNamed [
	| superType |
	self flag: 'FIXME ignore ? and ! for this'.
	superType := self superType.
	^ superType isUnion
		ifTrue: [ false ]
		ifFalse: [ superType isNamed ]
]

{ #category : #'as yet unclassified' }
TypUnionType >> isNullable [
	^ types includes: TypNilType instance
]

{ #category : #converting }
TypUnionType >> isParametric [
	| superType |
	self flag: 'FIXME ignore ? and ! for this'.
	superType := self superType.
	^ superType isUnion
		ifTrue: [ false ]
		ifFalse: [ superType isParametric ]
]

{ #category : #testing }
TypUnionType >> isUnion [
	^ true
]

{ #category : #'as yet unclassified' }
TypUnionType >> lookupSelector: aSymbol [
	self assert: [ self canUnderstand: aSymbol ].
	^ types flatCollect: [ :e | e lookupSelector: aSymbol ]
]

{ #category : #generated }
TypUnionType >> parameters [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	self assert: [ self isParametric ].
	^ (self superType "typCastAs TypParametricType") parameters
]

{ #category : #'as yet unclassified' }
TypUnionType >> postCopy [
	super postCopy.
	types := types collect: #copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream [
	aStream
		<< '{';
		<<
			((types includes: TypNilType instance)
				ifTrue: [ '!' ]
				ifFalse: [ '' ]);
		<<
			((types includes: TypUnknownType instance)
				ifTrue: [ '?' ]
				ifFalse: [ '' ]).
	(types
		copyWithoutAll:
			{TypNilType instance.
			TypUnknownType instance})
		ifNotEmpty: [ :e | 
			| type |
			type := e typAsType.
			type isUnion
				ifTrue: [ type := type superType ].
			aStream << type printString ].
	aStream << '}'
]

{ #category : #accessing }
TypUnionType >> superType [
	self assert: [ self hasSuperType ].
	^ superType
]

{ #category : #accessing }
TypUnionType >> types [
	<typTypeResultAs: 'Set<TypType>'>
	^ types copy
]
