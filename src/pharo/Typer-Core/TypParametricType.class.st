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
	aType parameters size <= parameters size
		ifFalse: [ ^ false ].
	(parameters keys copyFrom: 1 to: aType parameters size)
		= aType parameters keys
		ifFalse: [ ^ false ].
	^ aType parameters keys
		allSatisfy: [ :e | (self at: e) >= (aType at: e) ]
]

{ #category : #converting }
TypParametricType >> asCompatibleWith: aType [
	| copy |
	(aType isParametric
		and: [ name = aType name and: [ parameters = aType parameters ] ])
		ifFalse: [ ^ super asCompatibleWith: aType ].
	copy := self copy.
	parameters
		keysAndValuesDo: [ :n :t | copy at: n put: (t asCompatibleWith: (aType at: n)) ].
	^ copy
]

{ #category : #accessing }
TypParametricType >> at: aString [
	^ parameters at: aString
]

{ #category : #accessing }
TypParametricType >> at: aString put: aType [
	superType := nil. "must be nilled as change in binding might invalidate super type"
	^ parameters at: aString put: aType
]

{ #category : #copying }
TypParametricType >> copyWithParameters: aCollection [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	^ self copy
		initializeParameters:
			(parameters associations
				with: aCollection
				collect: [ :e :f | e key -> f ]) asOrderedDictionary;
		yourself
]

{ #category : #comparing }
TypParametricType >> hash [
	^ super hash bitXor: parameters hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	super initialize.
	parameters := OrderedDictionary new
]

{ #category : #accessing }
TypParametricType >> initializeParameters: anOrderedDictionary [
	self assert: [ anOrderedDictionary isNotEmpty ].
	parameters := anOrderedDictionary.
	parameters
		do: [ :e | 
			(e isVariable and: [ e scope isNil ])
				ifTrue: [ e scope: self ] ].
	superType := nil
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
	superType isParametric
		ifTrue: [ superType := superType
				copyWithParameters:
					((parameters keys intersection: superType parameters keys)
						collect: [ :e | self at: e ]) ].
	^ superType
]
