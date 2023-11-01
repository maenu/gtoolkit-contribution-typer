Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'parameters'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #'instance creation' }
TypParametricType class >> classDescription: aClassDescription [

	self shouldNotImplement
]

{ #category : #accessing }
TypParametricType class >> classDescription: aClassDescription parameters: aCollection [
	| instance |
	instance := self new
			initializeClassDescription: aClassDescription;
			initializeParameters: (aCollection as: OrderedIdentityDictionary);
			yourself.
	^ self index
		at: {aClassDescription name.
				aCollection as: OrderedIdentityDictionary.
				instance superOrNil}
		ifAbsentPut: [ instance ]
]

{ #category : #accessing }
TypParametricType class >> classDescription: aClassDescription parameters: aDictionary super: aType [
	^ self index
		at: {aClassDescription name.
				aDictionary as: OrderedIdentityDictionary.
				aType}
		ifAbsentPut: [ self new
				initializeClassDescription: aClassDescription;
				initializeParameters: (aDictionary as: OrderedIdentityDictionary);
				initializeSuper: aType;
				yourself ]
]

{ #category : #'instance creation' }
TypParametricType class >> classDescription: aClassDescription super: aType [

	self shouldNotImplement
]

{ #category : #'instance creation' }
TypParametricType class >> named: aString [

	self shouldNotImplement
]

{ #category : #accessing }
TypParametricType class >> named: aSymbol parameters: aDictionary [
	| instance |
	instance := self new
			initializeName: aSymbol asSymbol;
			initializeParameters: (aDictionary as: OrderedIdentityDictionary);
			yourself.
	^ self index
		at: {aSymbol asSymbol.
				aDictionary as: OrderedIdentityDictionary.
				instance superOrNil}
		ifAbsentPut: [ instance ]
]

{ #category : #accessing }
TypParametricType class >> named: aSymbol parameters: aDictionary super: aType [
	^ self index
		at: {aSymbol asSymbol.
				aDictionary as: OrderedIdentityDictionary.
				aType}
		ifAbsentPut: [ self new
				initializeName: aSymbol asSymbol;
				initializeParameters: (aDictionary as: OrderedIdentityDictionary);
				initializeSuper: aType;
				yourself ]
]

{ #category : #'instance creation' }
TypParametricType class >> named: aString super: aType [

	self shouldNotImplement
]

{ #category : #comparing }
TypParametricType >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	^ parameters = anObject parameters
]

{ #category : #comparing }
TypParametricType >> > aType [
	aType = self
		ifTrue: [ ^ false ].
	(aType class inheritsFrom: self class)
		ifTrue: [ ^ self >= (aType as: self class) ].
	(aType isParametric and: [ aType name = name ])
		ifFalse: [ ^ super > aType ].
	(aType parameters keys includesAll: parameters keys)
		ifFalse: [ ^ false ].
	^ parameters keys allSatisfy: [ :e | (self at: e) >= (aType at: e) ]
]

{ #category : #compatibility }
TypParametricType >> at: aSymbol [
	self assert: [ aSymbol isSymbol ].
	^ parameters at: aSymbol ifAbsent: [ self super at: aSymbol ]
]

{ #category : #converting }
TypParametricType >> contravariant: aType [

	| copyParameters otherParameters |
	(aType isParametric and: [ 
		 name = aType name and: [ parameters keys = aType parameters keys ] ]) 
		ifFalse: [ ^ super contravariant: aType ].
	otherParameters := aType parameters.
	copyParameters := OrderedCollection new.
	parameters keysAndValuesDo: [ :n :t | 
		copyParameters add: (t contravariant: (aType at: n)) ].
	^ self withParameters: copyParameters
]

{ #category : #converting }
TypParametricType >> covariant: aType [
	| copyParameters otherParameters |
	(aType isParametric
		and: [ name = aType name and: [ parameters keys = aType parameters keys ] ])
		ifFalse: [ ^ super covariant: aType ].
	otherParameters := aType parameters.
	otherParameters = parameters ifTrue: [ ^ self ].
	copyParameters := OrderedCollection new.
	parameters
		keysAndValuesDo: [ :n :t | copyParameters add: (t covariant: (aType at: n)) ].
	^ self withParameters: copyParameters
]

{ #category : #invalidation }
TypParametricType >> dependsOnClassDescription: aClassDescription [
	(super dependsOnClassDescription: aClassDescription) ifTrue: [ ^ true ].
	^ parameters
		anySatisfy: [ :t | t dependsOnClassDescription: aClassDescription ]
]

{ #category : #invalidation }
TypParametricType >> dependsOnCompiledMethod: aCompiledMethod [
	(super dependsOnCompiledMethod: aCompiledMethod) ifTrue: [ ^ true ].
	^ parameters anySatisfy: [ :t | t dependsOnCompiledMethod: aCompiledMethod ]
]

{ #category : #comparing }
TypParametricType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ 37 ].
	^ parameters values
		  inject: ((37 bitXor: parameters keys hash) bitXor:
				   (super hashSkipping: anIdentitySet))
		  into: [ :r :e | r bitXor: (e hashSkipping: anIdentitySet) ]
]

{ #category : #initialization }
TypParametricType >> initialize [

	<typPraResult: 'TypParametricType'>
	<typPraVariable: 'parameters' as: 'OrderedDictionary<Symbol,TypType>'>
	super initialize.
	parameters := OrderedIdentityDictionary new
]

{ #category : #initialization }
TypParametricType >> initializeParameters: aDictionary [
	self assert: [ aDictionary isKindOf: OrderedIdentityDictionary ].
	self assert: [ aDictionary isNotEmpty ].
	parameters removeAll.
	aDictionary
		keysAndValuesDo: [ :k :v | parameters at: k put: (v isBound ifTrue: [ v ] ifFalse: [ v boundTo: self ]) ].
	self initializeSuper: nil
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
]

{ #category : #compatibility }
TypParametricType >> parameters [

	^ parameters
]

{ #category : #copying }
TypParametricType >> postCopy [

	super postCopy.
	parameters := parameters copy
]

{ #category : #printing }
TypParametricType >> printNameOn: aStream skipping: anIdentitySet [
	"trickery for parameter-less string"

	super printOn: aStream skipping: anIdentitySet
]

{ #category : #printing }
TypParametricType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << name asString.
	aStream << '<'.
	parameters values
		withIndexDo: [ :e :i | 
			e printOn: aStream skipping: anIdentitySet , {self}.
			i < parameters size
				ifTrue: [ aStream << ',' ] ].
	aStream << '>'
]

{ #category : #accessing }
TypParametricType >> super [

	superType ifNotNil: [ ^ superType ].
	superType := super super.
	(superType isParametric and: [ 
		 parameters keys includesAll: superType parameters keys ]) ifTrue: [ 
		self initializeSuper: (superType withParameters:
				 (superType parameters keys collect: [ :e | self at: e ])) ].
	^ superType
]

{ #category : #'as yet unclassified' }
TypParametricType >> typGtParametersFor: aView [

	<gtView>
	^ aView forward
		  title: 'Parameters';
		  priority: 5;
		  object: parameters;
		  view: #gtItemsFor:
]

{ #category : #compatibility }
TypParametricType >> withAt: aSymbol put: aType [
	self assert: [ aSymbol isSymbol ].
	^ self
		withParameters: (parameters copy
				at: aSymbol put: aType;
				values)
]

{ #category : #compatibility }
TypParametricType >> withParameters: aCollection [
	| copyParameters |
	copyParameters := (1 to: (aCollection size min: parameters size))
			collect: [ :i | (parameters keys at: i) -> (aCollection at: i) ].
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				parameters: copyParameters
				super: self superOrNil ].
	^ self class
		named: name
		parameters: copyParameters
		super: self superOrNil
]

{ #category : #compatibility }
TypParametricType >> withSuper: aType [

	self hasClassDescription ifTrue: [ 
		^ self class
			  classDescription: self classDescription
			  parameters: parameters copy
			  super: aType ].
	^ self class named: name parameters: parameters copy super: aType
]
