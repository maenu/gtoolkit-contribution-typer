Class {
	#name : #TypUnionType,
	#superclass : #TypType,
	#instVars : [
		'types',
		'hasSuperType'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #converting }
TypUnionType class >> asTypes: aCollection [
	<typPraResult: 'Set<TypType>'>
	<typPraArguments: 'Collection<TypType>'>
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

{ #category : #'instance creation' }
TypUnionType class >> types: aCollection [
	<typPraArguments: 'Collection<TypType>'>
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

{ #category : #polymorphic }
TypUnionType >> arguments [

	| arguments n |
	arguments := types collect: #arguments.
	n := (arguments collect: #size) max.
	^ (1 to: n) collect: [ :i | 
		  | types_ |
		  types_ := Set new.
		  arguments do: [ :e | 
			  i <= e size ifTrue: [ types_ add: (e at: i) ] ].
		  types_ typAsType ]
]

{ #category : #converting }
TypUnionType >> asNonNullable [

	^ self isNullable
		  ifTrue: [ 
			  (types copyWithout: TypNilType new) typAsType copyWithOrigins:
				  { (TypConversionOrigin
					   type: self
					   selector: #asNonNullable
					   arguments: #(  )) } ]
		  ifFalse: [ self ]
]

{ #category : #converting }
TypUnionType >> asNullable [

	^ self isNullable
		  ifTrue: [ self ]
		  ifFalse: [ 
			  (types , { TypNilType new }) typAsType copyWithOrigins:
				  { (TypConversionOrigin
					   type: self
					   selector: #asNullable
					   arguments: #(  )) } ]
]

{ #category : #polymorphic }
TypUnionType >> at: aString [

	^ (types collect: [ :e | e at: aString ]) typAsType
]

{ #category : #testing }
TypUnionType >> hasSuperType [

	| remains hasNil nilType hasUnknown unknownType current superType_ |
	superType ifNotNil: [ ^ true ].
	hasNil := false.
	hasUnknown := false.
	remains := types asIdentitySet.
	remains do: [ :e | 
		e isNil ifTrue: [ 
			hasNil := true.
			nilType := e ].
		e isUnknown ifTrue: [ 
			hasUnknown := true.
			unknownType := e ] ].
	hasNil ifTrue: [ remains remove: nilType ].
	hasUnknown ifTrue: [ remains remove: unknownType ].
	remains ifEmpty: [ ^ false ].
	current := remains remove: remains anyOne.
	(remains isEmpty and: [ current hasSuperType ]) ifTrue: [ 
		current := current superType ].
	[ remains isEmpty ] whileFalse: [ 
		| next common |
		next := remains remove: remains anyOne.
		common := current asCompatibleWith: next.
		common isNil ifTrue: [ 
			hasNil := true.
			nilType := common ].
		common isUnknown ifTrue: [ 
			hasUnknown := true.
			unknownType := common ].
		(common isUnknown not and: [ 
			 common isNil not and: [ common ~= current ] ]) ifTrue: [ 
			current := common.
			remains add: current ] ].
	remains := IdentitySet with: current.
	(hasNil and: [ (current >= nilType) not ]) ifTrue: [ 
		remains add: nilType ].
	hasUnknown ifTrue: [ remains add: unknownType ].
	superType_ := remains typAsType.
	(superType_ isUnion not or: [ superType_ types ~= types ]) ifTrue: [ 
		superType := superType_.
		^ true ].
	^ false
]

{ #category : #comparing }
TypUnionType >> hashSkipping: anIdentitySet [

	| visited |
	(anIdentitySet includes: self) ifTrue: [ ^ self identityHash ].
	visited := anIdentitySet , { self }.
	^ types
		  inject: (super hashSkipping: anIdentitySet)
		  into: [ :r :e | r bitXor: (e hashSkipping: visited) ]
]

{ #category : #accessing }
TypUnionType >> initialize [
	<typPraVariable: 'types' as: 'Set<TypType>'>
	super initialize
]

{ #category : #accessing }
TypUnionType >> initializeTypes: anObject [
	<typPraArguments: 'Set<TypType>'>
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
TypUnionType >> lookupMethod: aSymbol arguments: aCollection [
	^ (types collect: [ :e | e lookupMethod: aSymbol arguments: aCollection ]) typAsType
]

{ #category : #accessing }
TypUnionType >> lookupVariable: aSymbol [
	^ (types collect: [ :e | e lookupVariable: aSymbol ]) typAsType
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
	types_ := types asIdentitySet.
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
	types_
		do: [ :e | 
			types_ remove: e.
			e printOn: aStream skipping: anIdentitySet , {self}.
			types_ ifNotEmpty: [ aStream << ',' ] ].
	aStream << '}'
]

{ #category : #polymorphic }
TypUnionType >> result [

	^ (types collect: #result) typAsType
]

{ #category : #accessing }
TypUnionType >> types [
	<typPraResult: 'Set<TypType>'>
	^ types
]
