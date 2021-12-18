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
	^ self new
		initializeClassDescription: aClassDescription;
		initializeParameters: anOrderedDictionary;
		yourself
]

{ #category : #'instance creation' }
TypParametricType class >> named: aString [
	self shouldNotImplement
]

{ #category : #accessing }
TypParametricType class >> named: aString parameters: anOrderedDictionary [
	^ self new
		initializeName: aString;
		initializeParameters: anOrderedDictionary;
		yourself
]

{ #category : #accessing }
TypParametricType class >> newFrom: aType [
	self assert: [ aType isKindOf: self ].
	^ self named: aType name parameters: aType parameters copy
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

{ #category : #converting }
TypParametricType >> asCompatibleWith: aType [

	| copy copyParameters |
	(aType isParametric and: [ 
		 name = aType name and: [ parameters = aType parameters ] ]) 
		ifFalse: [ ^ super asCompatibleWith: aType ].
	copyParameters := OrderedDictionary new.
	parameters keysAndValuesDo: [ :n :t | 
		copyParameters at: n put: (t asCompatibleWith: (aType at: n)) ].
	^ self copyWithParameters: copyParameters
]

{ #category : #accessing }
TypParametricType >> at: aString [

	^ self at: aString ifAbsent: [ self superType at: aString ]
]

{ #category : #accessing }
TypParametricType >> at: aString ifAbsent: aBlock [

	^ parameters at: aString ifAbsent: aBlock
]

{ #category : #copying }
TypParametricType >> copyWithAt: aString put: aType [

	| copyParameters |
	copyParameters := OrderedCollection new.
	parameters keysAndValuesDo: [ :n :t | 
		copyParameters add: (n = aString
				 ifTrue: [ aType ]
				 ifFalse: [ t ]) ].
	^ self copyWithParameters: copyParameters
]

{ #category : #copying }
TypParametricType >> copyWithParameters: aCollection [
	<typPraArguments: 'SequenceableCollection<TypType>'>
	^ self copy
		initializeParameters:
			((1 to: (aCollection size min: parameters size))
				collect: [ :i | (parameters keys at: i) -> (aCollection at: i) ])
				asOrderedDictionary;
		yourself
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

{ #category : #accessing }
TypParametricType >> initializeParameters: anOrderedDictionary [

	self assert: [ anOrderedDictionary isNotEmpty ].
	parameters := OrderedDictionary new.
	anOrderedDictionary keysAndValuesDo: [ :n :t | 
		self outgoingAt: n ensure: t.
		parameters at: n put: t ].
	self initializeSuperType: nil
]

{ #category : #invalidation }
TypParametricType >> isAffectedByClassChange: aClassAnnouncement [

	^ (super isAffectedByClassChange: aClassAnnouncement) or: [ 
		  parameters anySatisfy: [ :e | 
			  e isAffectedByClassChange: aClassAnnouncement ] ]
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
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
TypParametricType >> superType [

	superType ifNotNil: [ ^ superType ].
	superType := super superType.
	(superType isParametric and: [ 
		 parameters keys includesAll: superType parameters keys ]) ifTrue: [ 
		self initializeSuperType: (superType copyWithParameters:
				 (superType parameters keys collect: [ :e | self at: e ])) ].
	^ superType
]
