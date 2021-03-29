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
	remains := aCollection
		flatCollect: [ :e | 
			e isUnion
				ifTrue: [ e types	"typCastAs TypUnionType" ]
				ifFalse: [ {e}	"typCastAs Collection<TypType>" ] ]
		as: Set.
	nil_ := remains includes: TypNilType new.
	nil_
		ifTrue: [ remains remove: TypNilType new ].
	remains := remains
		reject: [ :e | 
			(remains
				copyWithoutAll:
					{e.
					TypUnknownType new}) anySatisfy: [ :f | f >= e ] ].
	nil_
		ifTrue: [ remains add: TypNilType new ].
	^ remains
]

{ #category : #generated }
TypUnionType class >> types: aCollection [
	<typTypeArgument: 1 as: 'Collection<TypType>'>
	^ self new
		initializeTypes: (self asTypes: aCollection);
		yourself
]

{ #category : #comparing }
TypUnionType >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ types asSet = anObject types asSet
]

{ #category : #comparing }
TypUnionType >> > aType [
	aType isUnion
		ifFalse: [ ^ types anySatisfy: [ :e | e >= aType ] ].
	aType = self
		ifTrue: [ ^ false ].
	^ aType types allSatisfy: [ :e | self >= e ]
]

{ #category : #converting }
TypUnionType >> asNonNullable [
	^ self isNullable
		ifTrue: [ (types copyWithout: TypNilType new) typAsType
				addOrigin:
					(TypConversionOrigin
						type: self
						selector: #asNonNullable
						arguments: #());
				yourself ]
		ifFalse: [ self ]
]

{ #category : #converting }
TypUnionType >> asNullable [
	^ self isNullable
		ifTrue: [ self ]
		ifFalse: [ (types , {TypNilType new})
				typAsTypeaddOrigin:
					(TypConversionOrigin type: self selector: #asNullable arguments: #());
				yourself ]
]

{ #category : #testing }
TypUnionType >> hasSuperType [
	superType
		ifNil: [ | remains nil_ unknown current |
			remains := types
				rehash;
				copy.
			nil_ := remains includes: TypNilType new.
			nil_
				ifTrue: [ remains remove: TypNilType new ].
			unknown := remains includes: TypUnknownType new.
			unknown
				ifTrue: [ remains remove: TypUnknownType new ].
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
			(nil_ and: [ (current >= TypNilType new) not ])
				ifTrue: [ remains add: TypNilType new ].
			unknown
				ifTrue: [ remains add: TypUnknownType new ].
			superType := remains typAsType ].
	^ superType isUnion not or: [ superType types size < types size ]
]

{ #category : #comparing }
TypUnionType >> hash [
	^ super hash bitXor: types hash
]

{ #category : #accessing }
TypUnionType >> initialize [
	<typTypeVariable: 'types' as: 'Set<TypType>'>
	super initialize.
]

{ #category : #accessing }
TypUnionType >> initializeTypes: anObject [
	<typTypeArgument: 1 as: 'Set<TypType>'>
	self
		assert: [ | types_ |
			types_ := self class asTypes: anObject.
			types_ size > 1 and: [ types_ = anObject ] ].
	types := anObject
]

{ #category : #'as yet unclassified' }
TypUnionType >> isNullable [
	^ types includes: TypNilType new
]

{ #category : #testing }
TypUnionType >> isUnion [
	^ true
]

{ #category : #accessing }
TypUnionType >> postCopy [
	super postCopy.
	types := types copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream skipping: anIdentitySet [
	| types_ |
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	types_ := types copy.
	aStream << '{'.
	types_
		detect: [ :e | e = TypNilType new ]
		ifFound: [ :e | 
			types_ remove: e.
			e printOn: aStream skipping: anIdentitySet , {self}.
			types_ ifNotEmpty: [ aStream << ',' ] ]
		ifNone: [  ].
	types_
		detect: [ :e | e = TypUnknownType new ]
		ifFound: [ :e | 
			types_ remove: e.
			e printOn: aStream skipping: anIdentitySet , {self}.
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
			e printOn: aStream skipping: anIdentitySet , {self}.
			types_ ifNotEmpty: [ aStream << ',' ] ].
	aStream << '}'
]

{ #category : #accessing }
TypUnionType >> types [
	<typTypeResultAs: 'Set<TypType>'>
	^ types
]
