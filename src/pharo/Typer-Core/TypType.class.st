Class {
	#name : #TypType,
	#superclass : #TypNode,
	#instVars : [
		'superType',
		'value',
		'hasValue'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #comparing }
TypType >> < aType [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'TypType'>
	^ aType > self
]

{ #category : #comparing }
TypType >> <= aType [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'TypType'>
	^ aType >= self
]

{ #category : #accessing }
TypType >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	self hasValue = anObject hasValue ifFalse: [ ^ false ].
	(self hasValue and: [ self value ~= anObject value ]) ifTrue: [ 
		^ false ].
	self hasSuperType = anObject hasSuperType ifFalse: [ ^ false ].
	self hasSuperType ifFalse: [ ^ true ].
	^ self superType = anObject superType
]

{ #category : #comparing }
TypType >> > aType [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'TypType'>
	aType = self
		ifTrue: [ ^ false ].
	aType hasSuperType
		ifFalse: [ ^ false ].
	^ self >= aType superType
]

{ #category : #comparing }
TypType >> >= aType [
	<typPraResult: 'Boolean'>
	<typPraArguments: 'TypType'>
	^ self > aType or: [ self = aType ]
]

{ #category : #converting }
TypType >> asCompatibleWith: aType [

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	aType isVariable ifTrue: [ ^ aType ].
	aType isUnknown ifTrue: [ ^ aType ].
	aType isNil ifTrue: [ ^ self asNullable ].
	self >= aType ifTrue: [ ^ self ].
	self hasSuperType ifTrue: [ ^ self superType asCompatibleWith: aType ].
	^ self addOutgoingTarget: TypUnknownType new data: #asCompatibleWith:
]

{ #category : #converting }
TypType >> asNonNullable [
	<typPraResult: 'TypType'>
	^ self
]

{ #category : #converting }
TypType >> asNullable [

	<typPraResult: 'TypType'>
	^ self outgoingAt: #asNullable ifAbsentPut: [ 
		  { 
			  TypNilType new.
			  self } typAsType ]
]

{ #category : #copying }
TypType >> copyWithSuperType: aType [

	^ self copy
		  initializeSuperType: aType;
		  yourself
]

{ #category : #copying }
TypType >> copyWithValue: anObject [

	^ self outgoingAt: #copyWithValue: -> anObject ifAbsentPut: [ 
		  self copy
			  initializeValue: anObject;
			  yourself ]
]

{ #category : #testing }
TypType >> hasSuperType [
	^ superType isNotNil
]

{ #category : #accessing }
TypType >> hasValue [
	^ hasValue
]

{ #category : #accessing }
TypType >> hash [

	^ self hashSkipping: IdentitySet new
]

{ #category : #accessing }
TypType >> hashSkipping: anIdentitySet [

	<typPraArguments: 'IdentitySet<TypType>'>
	<typPraResult: 'Integer'>
	(anIdentitySet includes: self) ifTrue: [ ^ 23 ].
	anIdentitySet add: self.
	self hasSuperType ifFalse: [ ^ 23 ].
	^ 23 bitXor: (self superType hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypType >> initialize [

	<typPraVariable: 'superType' as: '{!,TypType}'>
	<typPraVariable: 'value' as: '{!,Object}'>
	<typPraVariable: 'hasValue' as: 'Boolean'>
	super initialize.
	hasValue := false
]

{ #category : #initialization }
TypType >> initializeSuperType: aType [

	superType := aType.
	self outgoingAt: #superType ensure: aType
]

{ #category : #initialization }
TypType >> initializeValue: anObject [

	hasValue := true.
	value := anObject
]

{ #category : #invalidation }
TypType >> isAffectedByClassChange: aClassAnnouncement [

	^ false
]

{ #category : #invalidation }
TypType >> isAffectedByMethodChange: aMethodAnnouncement [

	^ false
]

{ #category : #testing }
TypType >> isFunction [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNamed [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNil [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNullable [
	^ self isNil
]

{ #category : #testing }
TypType >> isParametric [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnion [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnknown [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isVariable [
	<typPraResult: 'Boolean'>
	^ false
]

{ #category : #lookup }
TypType >> lookupMethod: aSymbol [

	| arguments |
	arguments := aSymbol numArgs typTimesCollect: [ :e | 
		             TypUnknownType new ].
	^ self lookupMethod: aSymbol arguments: arguments
]

{ #category : #lookup }
TypType >> lookupMethod: aSymbol arguments: aCollection [
	^ TypMethodIndex instance
		lookupMethodReceiver: self
		selector: aSymbol
		arguments: aCollection
]

{ #category : #lookup }
TypType >> lookupVariable: aSymbol [
	^ TypVariableIndex instance
		lookupReceiver: self
		selector: aSymbol
]

{ #category : #converting }
TypType >> outgoingAt: anObject ensure: aNode [

	outgoing
		detect: [ :e | e data = anObject ]
		ifFound: [ :e | 
			e target = aNode
				ifTrue: [ ^ aNode ]
				ifFalse: [ self removeOutgoing: e ] ]
		ifNone: [ "noop" ].
	^ self addOutgoing:
		  (TypEdge origin: self target: aNode data: anObject)
]

{ #category : #converting }
TypType >> outgoingAt: anObject ifAbsentPut: aBlock [

	self flag:
		'TODO could improve linear scan to constant by maintaining index'.
	^ outgoing
		  detect: [ :e | e data = anObject ]
		  ifFound: #target
		  ifNone: [ self addOutgoingTarget: aBlock value data: anObject ]
]

{ #category : #printing }
TypType >> printOn: aStream [
	self printOn: aStream skipping: IdentitySet new
]

{ #category : #printing }
TypType >> printOn: aStream skipping: anIdentitySet [
	"Respects skipping set to not print recursive type infinitely."

	self subclassResponsibility
]

{ #category : #accessing }
TypType >> superType [

	<typPraResult: 'TypType'>
	self assert: [ self hasSuperType ].
	^ superType "typCastAs TypType"
]

{ #category : #accessing }
TypType >> value [
	self assert: [ self hasValue ].
	^ value
]
