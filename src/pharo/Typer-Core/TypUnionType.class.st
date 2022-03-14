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
TypUnionType class >> types: anIdentitySet [

	<typPraArguments: 'IdentitySet<TypType>'>
	^ self index at: anIdentitySet asIdentitySet ifAbsentPut: [ 
		  self new
			  initializeTypes: anIdentitySet asIdentitySet;
			  yourself ]
]

{ #category : #comparing }
TypUnionType >> = anObject [

	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
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
		  types_ := IdentitySet new.
		  arguments do: [ :e | 
			  i <= e size ifTrue: [ types_ add: (e at: i) ] ].
		  types_ typAsType ]
]

{ #category : #converting }
TypUnionType >> asNonNullable [

	<typEdge>
	^ self isNullable
		  ifTrue: [ (types reject: #isNil) typAsType ]
		  ifFalse: [ self ]
]

{ #category : #converting }
TypUnionType >> asNullable [

	<typEdge>
	^ self isNullable
		  ifTrue: [ self ]
		  ifFalse: [ (types , { TypNilType instance }) typAsType ]
]

{ #category : #polymorphic }
TypUnionType >> at: aString [

	<typEdge>
	^ (types collect: [ :e | e at: aString ]) typAsType
]

{ #category : #testing }
TypUnionType >> hasSuper [

	| remains nilTypes unknownTypes current superType_ |
	superType ifNotNil: [ ^ true ].
	remains := types copy.
	nilTypes := remains select: #isNil.
	unknownTypes := remains select: #isUnknown.
	remains
		removeAll: nilTypes;
		removeAll: unknownTypes.
	remains ifEmpty: [ ^ false ].
	current := remains remove: remains anyOne.
	(remains isEmpty and: [ current hasSuper ]) ifTrue: [ 
		current := current super ].
	[ remains isEmpty ] whileFalse: [ 
		| next common |
		next := remains remove: remains anyOne.
		common := current withCommon: next.
		common = current ifFalse: [ 
			current := common.
			remains add: current ] ].
	remains := IdentitySet with: current.
	remains
		addAll: nilTypes;
		addAll: unknownTypes.
	superType_ := remains typAsType.
	(superType_ isUnion not or: [ superType_ types ~= types ]) ifTrue: [ 
		self initializeSuper: superType_.
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

{ #category : #initialization }
TypUnionType >> initialize [
	<typPraVariable: 'types' as: 'IdentitySet<TypType>'>
	super initialize
]

{ #category : #initialization }
TypUnionType >> initializeTypes: anObject [

	<typPraArguments: 'IdentitySet<TypType>'>
	self assert: [ anObject isKindOf: IdentitySet ].
	self assert: [ anObject size > 1 ].
	anObject = types ifTrue: [ ^ self ].
	types := anObject.
	hash := nil
]

{ #category : #invalidation }
TypUnionType >> invalidateOnClassChange: aClassAnnouncement [

	^ types anySatisfy: [ :e | e invalidateOnClassChange: aClassAnnouncement ]
]

{ #category : #invalidation }
TypUnionType >> invalidateOnMethodChange: aMethodAnnouncement [

	^ types anySatisfy: [ :e | e invalidateOnMethodChange: aMethodAnnouncement ]
]

{ #category : #testing }
TypUnionType >> isNullable [

	^ types anySatisfy: #isNil
]

{ #category : #testing }
TypUnionType >> isUnion [
	^ true
]

{ #category : #lookup }
TypUnionType >> lookupMethod: aSymbol arguments: aCollection [

	<typEdge>
	^ (types collect: [ :e | 
		   e lookupMethod: aSymbol arguments: aCollection ]) typAsType
]

{ #category : #lookup }
TypUnionType >> lookupVariable: aSymbol [

	<typEdge>
	^ (types collect: [ :e | e lookupVariable: aSymbol ]) typAsType
]

{ #category : #copying }
TypUnionType >> postCopy [

	super postCopy.
	types := types copy
]

{ #category : #printing }
TypUnionType >> printOn: aStream skipping: anIdentitySet [

	| remains |
	(anIdentitySet includes: self) ifTrue: [ 
		aStream << '.'.
		^ self ].
	anIdentitySet add: self.
	remains := types copy.
	aStream << '{'.
	remains
		detect: #isNil
		ifFound: [ :e | 
			e printOn: aStream skipping: anIdentitySet.
			remains := remains reject: #isNil.
			remains ifNotEmpty: [ aStream << ',' ] ]
		ifNone: [  ].
	remains
		detect: #isUnknown
		ifFound: [ :e | 
			e printOn: aStream skipping: anIdentitySet.
			remains := remains reject: #isUnknown.
			remains ifNotEmpty: [ aStream << ',' ] ]
		ifNone: [  ].
	remains size > 1 ifTrue: [ 
		| type |
		type := remains size = types size
			        ifTrue: [ self ]
			        ifFalse: [ remains typAsType ].
		(type isUnion and: [ type hasSuper and: [ type super isUnion not ] ]) 
			ifTrue: [ 
				type super printOn: aStream.
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

	<typEdge>
	^ (types collect: #result) typAsType
]

{ #category : #accessing }
TypUnionType >> types [

	<typPraResult: 'IdentitySet<TypType>'>
	^ types copy
]

{ #category : #polymorphic }
TypUnionType >> withParameters: aCollection [

	<typEdge>
	^ (types collect: [ :e | e withParameters: aCollection ]) typAsType
]

{ #category : #converting }
TypUnionType >> withSuper: aType [

	^ self
]
