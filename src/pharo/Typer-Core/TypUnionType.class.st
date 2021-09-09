Class {
	#name : #TypUnionType,
	#superclass : #TypType,
	#instVars : [
		'types',
		'hasSuperType'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypUnionType class >> types: aSet [
	<typPraArguments: 'Set<TypType>'>
	^ self new
		initializeTypes: aSet;
		yourself
]

{ #category : #comparing }
TypUnionType >> = anObject [

	super = anObject ifFalse: [ ^ false ].
	^ types = anObject types
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

	self isNullable ifFalse: [ ^ self ].
	^ self
		  addDependent: (types reject: #isNil) typAsType
		  label: #asNonNullable
]

{ #category : #converting }
TypUnionType >> asNullable [

	self isNullable ifTrue: [ ^ self ].
	^ self
		  addDependent: (types , { TypNilType new }) typAsType
		  label: #asNullable
]

{ #category : #polymorphic }
TypUnionType >> at: aString [

	^ (types collect: [ :e | e at: aString ]) typAsType
]

{ #category : #testing }
TypUnionType >> hasSuperType [

	| remains nilTypes unknownTypes current superType_ |
	superType ifNotNil: [ ^ true ].
	remains := types asIdentitySet copy.
	nilTypes := remains select: #isNil.
	unknownTypes := remains select: #isUnknown.
	remains
		removeAll: nilTypes;
		removeAll: unknownTypes.
	remains ifEmpty: [ ^ false ].
	current := remains remove: remains anyOne.
	(remains isEmpty and: [ current hasSuperType ]) ifTrue: [ 
		current := current superType ].
	[ remains isEmpty ] whileFalse: [ 
		| next common |
		next := remains remove: remains anyOne.
		common := current asCompatibleWith: next.
		common = current ifFalse: [ 
			current := common.
			remains add: current ] ].
	remains := IdentitySet with: current.
	remains
		addAll: nilTypes;
		addAll: unknownTypes.
	superType_ := remains typAsType.
	(superType_ isUnion not or: [ superType_ types ~= types ]) ifTrue: [ 
		superType := superType_.
		^ true ].
	^ false
]

{ #category : #comparing }
TypUnionType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ 47 ].
	^ types
		  inject: (47 bitXor: (super hashSkipping: anIdentitySet))
		  into: [ :r :e | r bitXor: (e hashSkipping: anIdentitySet) ]
]

{ #category : #accessing }
TypUnionType >> initialize [
	<typPraVariable: 'types' as: 'Set<TypType>'>
	super initialize
]

{ #category : #accessing }
TypUnionType >> initializeTypes: anObject [

	<typPraArguments: 'Set<TypType>'>
	self assert: [ anObject size > 1 ].
	types := anObject
]

{ #category : #invalidation }
TypUnionType >> invalidate [

	super invalidate.
	types do: #invalidate
]

{ #category : #invalidation }
TypUnionType >> isInvalidatedByClassAnnouncement: aClassAnnouncement [

	^ types anySatisfy: [ :e | 
		  e isInvalidatedByClassAnnouncement: aClassAnnouncement ]
]

{ #category : #invalidation }
TypUnionType >> isInvalidatedByMethodAnnouncement: aMethodAnnouncement [

	^ types anySatisfy: [ :e | 
		  e isInvalidatedByMethodAnnouncement: aMethodAnnouncement ]
]

{ #category : #accessing }
TypUnionType >> isNullable [
	^ types anySatisfy: #isNil
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

	| remains hasNil nilType hasUnknown unknownType |
	(anIdentitySet includes: self) ifTrue: [ 
		aStream << '.'.
		^ self ].
	anIdentitySet add: self.
	remains := types asIdentitySet.
	aStream << '{'.
	remains
		detect: #isNil
		ifFound: [ :e | 
			e printOn: aStream skipping: anIdentitySet.
			remains ifNotEmpty: [ aStream << ',' ] ]
		ifNone: [  ].
	remains := remains reject: #isNil.
	remains
		detect: #isUnknown
		ifFound: [ :e | 
			e printOn: aStream skipping: anIdentitySet.
			remains ifNotEmpty: [ aStream << ',' ] ]
		ifNone: [  ].
	remains := remains reject: #isUnknown.
	remains size > 1 ifTrue: [ 
		| type |
		type := remains size = types size
			        ifTrue: [ self ]
			        ifFalse: [ remains typAsType ].
		(type isUnion and: [ 
			 type hasSuperType and: [ type superType isUnion not ] ]) ifTrue: [ 
			type superType printOn: aStream.
			remains removeAll ] ].
	remains copy do: [ :e | 
		e printOn: aStream skipping: anIdentitySet.
		remains
			remove: e;
			ifNotEmpty: [ aStream << ',' ] ].
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
