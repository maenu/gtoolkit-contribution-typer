Class {
	#name : #TypUnionType,
	#superclass : #TypType,
	#instVars : [
		'types'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypUnionType class >> types: aSet [
	<typPraArguments: 'Set<TypType>'>
	^ self index
		at: aSet asSet
		ifAbsentPut: [ self new
				initializeTypes: aSet asSet;
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

{ #category : #compatibility }
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

{ #category : #compatibility }
TypUnionType >> at: aString [

	<typEdge>
	^ (types collect: [ :e | e at: aString ]) typAsType
]

{ #category : #testing }
TypUnionType >> hasSuper [

	superType ifNotNil: [ ^ true ].
	^ ((types reject: #isNil) reject: #isUnknown) anySatisfy: #hasSuper
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
	<typPraVariable: 'types' as: 'Set<TypType>'>
	super initialize
]

{ #category : #initialization }
TypUnionType >> initializeTypes: anObject [
	<typPraArguments: 'Set<TypType>'>
	self assert: [ anObject isKindOf: Set ].
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

{ #category : #accessing }
TypUnionType >> preResolveMethod: aLookup [
	^ (types
		flatCollect: [ :e | 
			e
				preResolveMethod: (TypMethodLookup
						receiver: e
						selector: aLookup selector
						arguments: aLookup arguments
						super: nil) ]) reject: #isNil
]

{ #category : #'as yet unclassified' }
TypUnionType >> printNameOn: aStream skipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ self ].
	aStream nextPut: ${.
	types anyOne printNameOn: aStream skipping: anIdentitySet.
	aStream nextPut: $}
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

{ #category : #compatibility }
TypUnionType >> result [

	<typEdge>
	^ (types collect: #result) typAsType
]

{ #category : #accessing }
TypUnionType >> super [

	| remains nilTypes unknownTypes current |
	self assert: [ self hasSuper ].
	superType ifNotNil: [ ^ superType ].
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
		common := current contravariant: next.
		common = current ifFalse: [ 
			current := common.
			remains add: current ] ].
	remains := IdentitySet with: current.
	remains
		addAll: nilTypes;
		addAll: unknownTypes.
	self initializeSuper: remains typAsType.
	^ superType
]

{ #category : #accessing }
TypUnionType >> types [

	<typPraResult: 'IdentitySet<TypType>'>
	^ types copy
]

{ #category : #compatibility }
TypUnionType >> withParameters: aCollection [

	<typEdge>
	^ (types collect: [ :e | e withParameters: aCollection ]) typAsType
]

{ #category : #compatibility }
TypUnionType >> withSuper: aType [

	^ self
]
