Class {
	#name : #TypType,
	#superclass : #Object,
	#instVars : [
		'superType',
		'origins',
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
	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	self hasValue = anObject hasValue
		ifFalse: [ ^ false ].
	(self hasValue and: [ self value ~= anObject value ])
		ifTrue: [ ^ false ].
	self hasSuperType = anObject hasSuperType
		ifFalse: [ ^ false ].
	self hasSuperType
		ifFalse: [ ^ true ].
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

{ #category : #accessing }
TypType >> addOrigin: anOrigin [

	origins add: anOrigin
]

{ #category : #converting }
TypType >> asCompatibleWith: aType [

	<typPraResult: 'TypType'>
	<typPraArguments: 'TypType'>
	self flag: 'TODO only real usage in union type, odd one out'.
	aType isVariable ifTrue: [ ^ aType ].
	aType isUnknown ifTrue: [ ^ aType ].
	aType isNil ifTrue: [ ^ self asNullable ].
	self >= aType ifTrue: [ ^ self ].
	self hasSuperType ifTrue: [ ^ self superType asCompatibleWith: aType ].
	^ TypUnknownType new
		  addOrigin: (TypConversionOrigin
				   type: self
				   selector: #asCompatibleWith:
				   arguments: { aType });
		  yourself
]

{ #category : #converting }
TypType >> asNonNullable [
	<typPraResult: 'TypType'>
	^ self
]

{ #category : #converting }
TypType >> asNullable [

	<typPraResult: 'TypType'>
	^ { 
		  TypNilType new.
		  self } typAsType
		  addOrigin:
			  (TypConversionOrigin
				   type: self
				   selector: #asNullable
				   arguments: #(  ));
		  yourself
]

{ #category : #copying }
TypType >> copyWithSuperType: aType [

	^ self copy
		  initializeSuperType: aType;
		  yourself
]

{ #category : #copying }
TypType >> copyWithValue: anObject [

	^ self copy
		  initializeValue: anObject;
		  yourself
]

{ #category : #accessing }
TypType >> gtOriginsFor: aView [
	<gtView>
	^ aView forward
		title: 'Origins';
		object: [ origins ];
		view: #gtItemsFor:
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
	| hash |
	(anIdentitySet includes: self) ifTrue: [ ^ self identityHash ].
	hash := nil hash bitXor: 23.
	self hasSuperType ifTrue: [ 
		hash := hash bitXor:
			        (self superType hashSkipping: anIdentitySet , { self }) ].
	^ hash
]

{ #category : #initialization }
TypType >> initialize [

	<typPraVariable: 'superType' as: '{!,TypType}'>
	<typPraVariable: 'value' as: '{!,Object}'>
	<typPraVariable: 'hasValue' as: 'Boolean'>
	<typPraVariable: 'origins' as: 'SequenceableCollection<TypOrigin>'>
	super initialize.
	origins := OrderedCollection new.
	hasValue := false
]

{ #category : #initialization }
TypType >> initializeSuperType: aType [

	superType := aType
]

{ #category : #initialization }
TypType >> initializeValue: anObject [

	hasValue := true.
	value := anObject
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
	arguments := aSymbol numArgs timesCollect: [ TypUnknownType new ].
	^ self lookupMethod: aSymbol arguments: arguments
]

{ #category : #lookup }
TypType >> lookupMethod: aSymbol arguments: aCollection [
	^ TypMethodLookupIndex instance
		lookupMethodReceiver: self
		selector: aSymbol
		arguments: aCollection
]

{ #category : #lookup }
TypType >> lookupVariable: aSymbol [
	^ TypVariableLookupIndex instance
		lookupReceiver: self
		selector: aSymbol
]

{ #category : #accessing }
TypType >> origins [
	^ origins
]

{ #category : #accessing }
TypType >> postCopy [
	super postCopy.
	origins := origins copy
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
	^ superType	"typCastAs TypType"
]

{ #category : #accessing }
TypType >> value [
	self assert: [ self hasValue ].
	^ value
]
