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
		types: (self asTypes: aCollection);
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
TypUnionType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	| superType |
	superType := self superType.
	superType isUnion
		ifTrue: [ TypNoTypeError signal ].
	^ superType asFunctionType: someTypes result: aType optionalParameters: aBoolean
]

{ #category : #converting }
TypUnionType >> asNamedType [
	| superType |
	superType := self superType.
	superType isUnion
		ifTrue: [ TypNoTypeError signal ].
	^ superType
]

{ #category : #converting }
TypUnionType >> asNonNullableType [
	^ (types includes: TypNilType instance)
		ifTrue: [ (types copyWithout: TypNilType instance) typAsType ]
		ifFalse: [ self ]
]

{ #category : #converting }
TypUnionType >> asParametricType: someTypes [
	| superType |
	superType := self superType.
	superType isUnion
		ifTrue: [ TypNoTypeError signal ].
	^ superType asParametricType: someTypes
]

{ #category : #accessing }
TypUnionType >> asTypeCompatibleWith: aType [
	| types_ |
	types_ := self class asTypes: types , {aType}.
	^ types_ size = 1
		ifTrue: [ types_ anyOne ]
		ifFalse: [ self class types: types_ ]
]

{ #category : #'as yet unclassified' }
TypUnionType >> canUnderstand: aSymbol [
	^ types allSatisfy: [ :e | e canUnderstand: aSymbol ]
]

{ #category : #converting }
TypUnionType >> classDescription [
	| superType |
	superType := self superType.
	superType isUnion
		ifTrue: [ TypNoClassDescriptionError signal ].
	^ superType classDescription
]

{ #category : #testing }
TypUnionType >> hasParametersCompatibleWithThoseOf: aType [
	<typTypeArgument: 1 as: 'TypFunctionType'>
	<typTypeResultAs: 'Boolean'>
	self assert: [ self isFunction ].
	^ (self superType "typCastAs TypFunctionType") hasParametersCompatibleWithThoseOf: aType
]

{ #category : #testing }
TypUnionType >> hasSuperType [
	^ self superType_ ~= self
]

{ #category : #comparing }
TypUnionType >> hash [
	^ types hash
]

{ #category : #accessing }
TypUnionType >> initialize [
	<typTypeParametersAs: 'TypType'>
	<typTypeVariable: 'types' as: 'Set<TypType>'>
	super initialize.
	types := Set new "typParameters TypType"
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
	| methods |
	methods := Set new.
	types
		do: [ :e | 
			methods
				addAll:
					([ e lookupSelector: aSymbol ]
						on: TypNoMethodError
						do: [ Set new ]) ].
	^ methods ifEmpty: [ super lookupSelector: aSymbol ]
]

{ #category : #'as yet unclassified' }
TypUnionType >> nullable [
	^ types includes: TypNilType instance
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

{ #category : #testing }
TypUnionType >> representsClassDescription [
	^ self superType representsClassDescription
]

{ #category : #accessing }
TypUnionType >> superType [
	self hasSuperType
		ifFalse: [ TypNoTypeError signal ].
	^ self superType_
]

{ #category : #accessing }
TypUnionType >> superType_ [
	| remains nil_ unknown current |
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
	^ remains typAsType
]

{ #category : #accessing }
TypUnionType >> types [
	<typTypeResultAs: 'Set<TypType>'>
	^ types
]

{ #category : #accessing }
TypUnionType >> types: anObject [
	<typTypeArgument: 1 as: 'Set<TypType>'>
	self
		assert: [ | types_ |
			types_ := self class asTypes: anObject.
			types_ size > 1 and: [ types_ = anObject ] ].
	types := anObject
]
