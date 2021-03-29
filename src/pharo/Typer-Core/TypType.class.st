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
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ aType > self
]

{ #category : #comparing }
TypType >> <= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
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
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	aType = self
		ifTrue: [ ^ false ].
	aType hasSuperType
		ifFalse: [ ^ false ].
	^ self >= aType superType
]

{ #category : #comparing }
TypType >> >= aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'Boolean'>
	^ self > aType or: [ self = aType ]
]

{ #category : #accessing }
TypType >> addOrigin: anOrigin [
	(origins includes: anOrigin)
		ifTrue: [ ^ self ].
	origins add: anOrigin
]

{ #category : #converting }
TypType >> asCompatibleWith: aType [
	<typTypeArgument: 1 as: 'TypType'>
	<typTypeResultAs: 'TypType'>
	self flag: 'TODO only real usage in union type, odd one out'.
	aType isVariable
		ifTrue: [ ^ aType ].
	aType isUnknown
		ifTrue: [ ^ aType ].
	aType isNil
		ifTrue: [ ^ self asNullable ].
	self >= aType
		ifTrue: [ ^ self ].
	self hasSuperType
		ifTrue: [ ^ self superType asCompatibleWith: aType ].
	^ TypUnknownType new
		addOrigin:
			(TypConversionOrigin
				type: self
				selector: #asCompatibleWith:
				arguments: {aType});
		yourself
]

{ #category : #converting }
TypType >> asNonNullable [
	<typTypeResultAs: 'TypType'>
	^ self
]

{ #category : #converting }
TypType >> asNullable [
	<typTypeResultAs: 'TypType'>
	^ {TypNilType new.
	self} typAsType
		addOrigin:
			(TypConversionOrigin type: self selector: #asNullable arguments: #());
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
	| hash |
	hash := nil hash bitXor: 23.
	self hasValue
		ifTrue: [ hash := hash bitXor: self value hash ].
	self hasSuperType
		ifTrue: [ hash := hash bitXor: self superType hash ].
	^ hash
]

{ #category : #initialization }
TypType >> initialize [
	<typTypeVariable: 'superType' as: '{!,TypType}'>
	super initialize.
	origins := OrderedCollection new.
	hasValue := false
]

{ #category : #testing }
TypType >> isFunction [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNamed [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNil [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isNullable [
	^ self isNil
]

{ #category : #testing }
TypType >> isParametric [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnion [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isUnknown [
	<typTypeResultAs: 'Boolean'>
	^ false
]

{ #category : #testing }
TypType >> isVariable [
	<typTypeResultAs: 'Boolean'>
	^ false
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
	<typTypeResultAs: 'TypType'>
	self assert: [ self hasSuperType ].
	^ superType "typCastAs TypType"
]

{ #category : #accessing }
TypType >> superType: aType [
	<typTypeArgument: 1 as: 'TypType'>
	superType := aType
]

{ #category : #accessing }
TypType >> value [
	self assert: [ self hasValue ].
	^ value
]

{ #category : #accessing }
TypType >> value: anObject [
	hasValue := true.
	value := anObject
]
