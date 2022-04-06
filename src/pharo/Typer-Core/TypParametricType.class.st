Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'parameters'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypParametricType class >> classDescription: aClassDescription [

	self shouldNotImplement
]

{ #category : #accessing }
TypParametricType class >> classDescription: aClassDescription parameters: anOrderedDictionary [

	| instance |
	instance := self new
		            initializeClassDescription: aClassDescription;
		            initializeParameters: anOrderedDictionary;
		            yourself.
	^ self index
		  at: { 
				  aClassDescription name.
				  anOrderedDictionary asOrderedDictionary.
				  instance superOrNil }
		  ifAbsentPut: [ instance ]
]

{ #category : #accessing }
TypParametricType class >> classDescription: aClassDescription parameters: anOrderedDictionary super: aType [

	^ self index
		  at: { 
				  aClassDescription name.
				  anOrderedDictionary asOrderedDictionary.
				  aType }
		  ifAbsentPut: [ 
			  self new
				  initializeClassDescription: aClassDescription;
				  initializeParameters: anOrderedDictionary;
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
TypParametricType class >> named: aString parameters: anOrderedDictionary [

	| instance |
	instance := self new
		            initializeName: aString asString;
		            initializeParameters: anOrderedDictionary;
		            yourself.
	^ self index
		  at: { 
				  aString asString.
				  anOrderedDictionary asOrderedDictionary.
				  instance superOrNil }
		  ifAbsentPut: [ instance ]
]

{ #category : #accessing }
TypParametricType class >> named: aString parameters: anOrderedDictionary super: aType [

	^ self index
		  at: { 
				  aString asString.
				  anOrderedDictionary asOrderedDictionary.
				  aType }
		  ifAbsentPut: [ 
			  self new
				  initializeName: aString asString;
				  initializeParameters: anOrderedDictionary;
				  initializeSuper: aType;
				  yourself ]
]

{ #category : #'instance creation' }
TypParametricType class >> named: aString super: aType [

	self shouldNotImplement
]

{ #category : #comparing }
TypParametricType >> = aType [
	super = aType
		ifFalse: [ ^ false ].
	^ parameters = aType parameters
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

{ #category : #accessing }
TypParametricType >> at: aString [

	^ self at: aString ifAbsent: [ self super at: aString ]
]

{ #category : #accessing }
TypParametricType >> at: aString ifAbsent: aBlock [

	^ parameters at: aString ifAbsent: aBlock
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
	<typPraVariable: 'parameters' as: 'OrderedDictionary<String,TypType>'>
	super initialize.
	parameters := OrderedDictionary new
]

{ #category : #initialization }
TypParametricType >> initializeParameters: anOrderedDictionary [

	self assert: [ anOrderedDictionary isNotEmpty ].
	parameters := anOrderedDictionary.
	parameters valuesDo: [ :e | e bind: self ].
	self initializeSuper: nil
]

{ #category : #invalidation }
TypParametricType >> invalidateOnClassChange: aClassAnnouncement [

	^ (super invalidateOnClassChange: aClassAnnouncement) or: [ 
		  parameters anySatisfy: [ :e | 
			  e invalidateOnClassChange: aClassAnnouncement ] ]
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
]

{ #category : #converting }
TypParametricType >> loosen: aType [

	| copyParameters otherParameters |
	(aType isParametric and: [ 
		 name = aType name and: [ parameters keys = aType parameters keys ] ]) 
		ifFalse: [ ^ super loosen: aType ].
	otherParameters := aType parameters.
	copyParameters := OrderedCollection new.
	parameters keysAndValuesDo: [ :n :t | 
		copyParameters add: (t loosen: (aType at: n)) ].
	^ self withParameters: copyParameters
]

{ #category : #accessing }
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

	^ String streamContents: [ :s | 
		  super printOn: s skipping: anIdentitySet ]
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

{ #category : #converting }
TypParametricType >> tighten: aType [

	| copyParameters otherParameters |
	(aType isParametric and: [ 
		 name = aType name and: [ parameters keys = aType parameters keys ] ]) 
		ifFalse: [ ^ super tighten: aType ].
	otherParameters := aType parameters.
	copyParameters := OrderedCollection new.
	parameters keysAndValuesDo: [ :n :t | 
		copyParameters add: (t tighten: (aType at: n)) ].
	^ self withParameters: copyParameters
]

{ #category : #accessing }
TypParametricType >> typGtParametersFor: aView [

	<gtView>
	^ aView forward
		  title: 'Parameters';
		  priority: 5;
		  object: parameters;
		  view: #gtItemsFor:
]

{ #category : #converting }
TypParametricType >> withAt: aSymbol put: aType [

	^ self withParameters: (parameters copy
			   at: aSymbol put: aType;
			   values)
]

{ #category : #converting }
TypParametricType >> withParameters: aCollection [

	| copyParameters |
	copyParameters := ((1 to: (aCollection size min: parameters size)) 
		                   collect: [ :i | 
		                   (parameters keys at: i) -> (aCollection at: i) ])
		                  asOrderedDictionary.
	self hasClassDescription ifTrue: [ 
		^ self class
			  classDescription: self classDescription
			  parameters: copyParameters
			  super: self superOrNil ].
	^ self class
		  named: name
		  parameters: copyParameters
		  super: self superOrNil
]

{ #category : #converting }
TypParametricType >> withSuper: aType [

	self hasClassDescription ifTrue: [ 
		^ self class
			  classDescription: self classDescription
			  parameters: parameters copy
			  super: aType ].
	^ self class named: name parameters: parameters copy super: aType
]
