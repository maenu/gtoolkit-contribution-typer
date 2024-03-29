Class {
	#name : #TypUnionType,
	#superclass : #TypType,
	#instVars : [
		'types'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #'instance creation' }
TypUnionType class >> types: aSet [
	^ self index
		typAt: {aSet size} , (aSet sorted: [ :a :b | a identityHash < b identityHash ])
		ifAbsentPut: [ self new
				initializeTypes: aSet asIdentitySet;
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
	aType isUnknown ifTrue: [ ^ false ].
	aType isUnion ifFalse: [ ^ types anySatisfy: [ :e | e >= aType ] ].
	aType = self ifTrue: [ ^ false ].
	^ aType types allSatisfy: [ :e | self >= e ]
]

{ #category : #accessing }
TypUnionType >> allSelectors [
	^ types sorted flatCollect: #allSelectors
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
	^ self isNullable
		ifTrue: [ (types reject: #isNil) typAsType ]
		ifFalse: [ self ]
]

{ #category : #converting }
TypUnionType >> asNullable [
	^ self isNullable
		ifTrue: [ self ]
		ifFalse: [ (types , {TypNilType instance}) typAsType ]
]

{ #category : #compatibility }
TypUnionType >> at: aString [
	^ (types collect: [ :e | e at: aString ]) typAsType
]

{ #category : #accessing }
TypUnionType >> canLookupMethod: aSymbol arguments: aCollection [
	^ types allSatisfy: [ :t | t canLookupMethod: aSymbol arguments: aCollection ]
]

{ #category : #accessing }
TypUnionType >> canLookupVariable: aSymbol [
	^ types allSatisfy: [ :t | t canLookupVariable: aSymbol ]
]

{ #category : #invalidation }
TypUnionType >> dependsOnClassDescription: aClassDescription [
	(super dependsOnClassDescription: aClassDescription) ifTrue: [ ^ true ].
	^ types anySatisfy: [ :t | t dependsOnClassDescription: aClassDescription ]
]

{ #category : #invalidation }
TypUnionType >> dependsOnCompiledMethod: aCompiledMethod [
	(super dependsOnCompiledMethod: aCompiledMethod) ifTrue: [ ^ true ].
	^ types anySatisfy: [ :t | t dependsOnCompiledMethod: aCompiledMethod ]
]

{ #category : #testing }
TypUnionType >> hasSuper [
	superType ifNotNil: [ ^ true ].
	^ (types reject: [ :t | t isNil or: [ t isUnknown or: [ t isVoid ] ] ])
		anySatisfy: #hasSuper
]

{ #category : #comparing }
TypUnionType >> hashSkipping: anIdentitySet [
	(anIdentitySet includes: self) ifTrue: [ ^ 47 ].
	types size > 10 ifTrue: [ ^ 47 bitXor: types size hash ].
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
	self assert: [ (anObject anySatisfy: #isUnion) not ].
	self assert: [ anObject size > 1 ].
	anObject = types ifTrue: [ ^ self ].
	types := anObject.
	hash := nil
]

{ #category : #testing }
TypUnionType >> isNullable [

	^ types anySatisfy: #isNil
]

{ #category : #testing }
TypUnionType >> isUnion [
	^ true
]

{ #category : #accessing }
TypUnionType >> overriders: aSymbol [
	^ types flatCollect: [ :e | e overriders: aSymbol ]
]

{ #category : #copying }
TypUnionType >> postCopy [

	super postCopy.
	types := types copy
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
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	anIdentitySet add: self.
	remains := types copy.
	aStream << '{'.
	remains
		detect: #isNil
		ifFound: [ :e | 
			e printOn: aStream skipping: anIdentitySet.
			remains := remains reject: #isNil.
			remains ifNotEmpty: [ aStream << ',' ] ].
	remains
		detect: #isUnknown
		ifFound: [ :e | 
			e printOn: aStream skipping: anIdentitySet.
			remains := remains reject: #isUnknown.
			remains ifNotEmpty: [ aStream << ',' ] ].
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
	^ (types collect: #result) typAsType
]

{ #category : #'as yet unclassified' }
TypUnionType >> signalsAlways [
	| signals |
	signals := types collect: #signalsAlways.
	(signals includes: nil) ifTrue: [ ^ nil ].
	^ signals typAsMinimizedType
]

{ #category : #accessing }
TypUnionType >> signalsMaybe [
	^ (types collect: #signalsMaybe thenReject: #isNil)
		ifEmpty: nil
		ifNotEmpty: #typAsType
]

{ #category : #accessing }
TypUnionType >> super [
	| current remains nilTypes unknownTypes voidTypes |
	self assert: [ self hasSuper ].
	superType ifNotNil: [ ^ superType ].
	remains := types copy.
	nilTypes := remains select: #isNil.
	unknownTypes := remains select: #isUnknown.
	voidTypes := remains select: #isVoid.
	remains
		removeAll: nilTypes;
		removeAll: unknownTypes;
		removeAll: voidTypes.
	current := remains remove: remains anyOne.
	(remains isEmpty and: [ current hasSuper ])
		ifTrue: [ current := current super ].
	[ remains isEmpty ]
		whileFalse: [ | next common |
			next := remains remove: remains anyOne.
			common := current contravariant: next.
			common isUnion
				ifTrue: [ remains add: (current := TypUnknownType instance) ]
				ifFalse: [ current = common ifFalse: [ remains add: (current := common) ] ] ].
	remains := IdentitySet with: current.
	current >= ProtoObject typAsType
		ifTrue: [ unknownTypes
				ifNotEmpty: [ remains := IdentitySet with: TypUnknownType instance ] ]
		ifFalse: [ remains addAll: unknownTypes ].
	current >= Object typAsType ifFalse: [ remains addAll: nilTypes ].
	remains addAll: voidTypes.
	self initializeSuper: remains typAsType.
	^ superType
]

{ #category : #accessing }
TypUnionType >> types [

	<typPraResult: 'IdentitySet<TypType>'>
	^ types copy
]

{ #category : #'as yet unclassified' }
TypUnionType >> withNode: aNode [
	^ self class types: (types collect: [ :t | t withNode: aNode ])
]

{ #category : #compatibility }
TypUnionType >> withParameters: aCollection [
	^ (types collect: [ :e | e withParameters: aCollection ]) typAsType
]

{ #category : #compatibility }
TypUnionType >> withSuper: aType [

	^ self
]

{ #category : #accessing }
TypUnionType >> writers: aVariable [
	^ types flatCollect: [ :e | e writers: aVariable ]
]
