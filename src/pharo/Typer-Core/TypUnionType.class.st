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
	<typTypeArgument: 1 as: 'Collection<TypType>'>
	<typTypeResultAs: 'Set<TypType>'>
	| remains nil_ |
	remains := (aCollection
		flatCollect: [ :e | 
			e isUnion
				ifTrue: [ (e "typCastAs TypUnionType") types ]
				ifFalse: [ {e} "typCastAs Collection<TypType>" ] ]) asSet reject: #isNoType.
	nil_ := remains includes: TypNilType instance.
	nil_
		ifTrue: [ remains remove: TypNilType instance ].
	remains := remains
		reject: [ :e | 
			(remains
				copyWithoutAll:
					{e.
					TypUnknownType instance}) anySatisfy: [ :f | f >= e ] ].
	nil_
		ifTrue: [ remains add: TypNilType instance ].
	^ remains
]

{ #category : #generated }
TypUnionType class >> types: aCollection [
	<typTypeArgument: 1 as: 'Collection<TypType>'>
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
					self types asSet = object types asSet ] ]
]

{ #category : #comparing }
TypUnionType >> > aType [
	^ self ~= aType
		and: [ aType isUnion
				ifTrue: [ (aType "typCastAs TypUnionType") types allSatisfy: [ :e | self >= e ] ]
				ifFalse: [ types anySatisfy: [ :e | e >= aType ] ] ]
]

{ #category : #converting }
TypUnionType >> asCollection [
	^ self types
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
			remains
				ifEmpty: [ superType := self.
					^ false ].
			current := remains remove: remains anyOne.
			(remains isEmpty and: [ current hasSuperType ])
				ifTrue: [ current := current superType ].
			[ remains isEmpty ]
				whileFalse: [ | next common |
					next := remains remove: remains anyOne.
					common := current asCompatibleWith: next.
					common isNil
						ifTrue: [ nil_ := true ]
						ifFalse: [ common isUnknown
								ifTrue: [ unknown := true ]
								ifFalse: [ common = current
										ifFalse: [ current := common.
											remains add: current ] ] ] ].
			remains := Set with: current.
			(nil_ and: [ (current >= TypNilType instance) not ])
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

{ #category : #'as yet unclassified' }
TypUnionType >> isNullable [
	^ types includes: TypNilType instance
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

{ #category : #'as yet unclassified' }
TypUnionType >> postCopy [
	super postCopy.
	types := types collect: #copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream [
	| types_ |
	types_ := types copy.
	aStream << '{'.
	types_
		detect: [ :e | e = TypNilType instance ]
		ifFound: [ :e | 
			types_ remove: e.
			e printOn: aStream.
			types_ ifNotEmpty: [ aStream << ',' ] ]
		ifNone: [  ].
	types_
		detect: [ :e | e = TypUnknownType instance ]
		ifFound: [ :e | 
			types_ remove: e.
			e printOn: aStream.
			types_ ifNotEmpty: [ aStream << ',' ] ]
		ifNone: [  ].
	types_ size > 1
		ifTrue: [ | type_ |
			type_ := types_ = types
				ifTrue: [ self ]
				ifFalse: [ types_ typAsType ].
			(type_ isUnion
				and: [ type_ hasSuperType and: [ type_ superType isUnion not ] ])
				ifTrue: [ type_ superType printOn: aStream.
					types_ removeAll ] ].
	types_ copy
		do: [ :e | 
			types_ remove: e.
			e printOn: aStream.
			types_ ifNotEmpty: [ aStream << ',' ] ].
	aStream << '}'
]

{ #category : #accessing }
TypUnionType >> superType [
	self assert: [ self hasSuperType ].
	^ superType "typCastAs TypType"
]

{ #category : #accessing }
TypUnionType >> types [
	<typTypeResultAs: 'Set<TypType>'>
	^ types copy
]
