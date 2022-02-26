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

	^ index at: thisContext arguments ifAbsentPut: [ 
		  self new
			  initializeClassDescription: aClassDescription;
			  initializeParameters: anOrderedDictionary;
			  yourself ]
]

{ #category : #'instance creation' }
TypParametricType class >> named: aString [
	self shouldNotImplement
]

{ #category : #accessing }
TypParametricType class >> named: aString parameters: anOrderedDictionary [

	^ index at: thisContext arguments ifAbsentPut: [ 
		  self new
			  initializeName: aString;
			  initializeParameters: anOrderedDictionary;
			  yourself ]
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

	<typEdge>
	^ (aType isParametric and: [ 
		   name = aType name and: [ parameters = aType parameters ] ])
		  ifTrue: [ 
			  | copyParameters |
			  copyParameters := OrderedCollection new.
			  parameters keysAndValuesDo: [ :n :t | 
				  copyParameters add: (t asCompatibleWith: (aType at: n)) ].
			  self withParameters: copyParameters ]
		  ifFalse: [ super asCompatibleWith: aType ]
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
	parameters := OrderedDictionary new.
	anOrderedDictionary keysAndValuesDo: [ :n :t | 
		self outgoingAt: n put: t.
		parameters at: n put: t ].
	self initializeSuperType: nil.
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

{ #category : #accessing }
TypParametricType >> parameters [

	^ parameters copy
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
TypParametricType >> super [

	superType ifNotNil: [ ^ superType ].
	superType := super super.
	(superType isParametric and: [ 
		 parameters keys includesAll: superType parameters keys ]) ifTrue: [ 
		self initializeSuperType: (superType withParameters:
				 (superType parameters keys collect: [ :e | self at: e ])) ].
	^ superType
]

{ #category : #converting }
TypParametricType >> withAt: aSymbol put: aType [

	<typEdge>
	| copyParameters |
	self flag: 'TODO should use index lookup, not copy'.
	copyParameters := OrderedCollection new.
	parameters keysAndValuesDo: [ :n :t | 
		copyParameters add: (n = aSymbol
				 ifTrue: [ aType ]
				 ifFalse: [ t ]) ].
	^ self withParameters: copyParameters
]

{ #category : #converting }
TypParametricType >> withParameters: aCollection [

	<typPraArguments: 'SequenceableCollection<TypType>'>
	<typEdge>
	self flag: 'TODO should use index lookup, not copy'.
	^ self copy
		  initializeParameters:
			  ((1 to: (aCollection size min: parameters size)) collect: [ :i | 
					   (parameters keys at: i) -> (aCollection at: i) ])
				  asOrderedDictionary;
		  yourself
]
