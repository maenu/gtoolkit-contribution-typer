Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'bindings',
		'parameters'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypParametricType class >> classDescription: aClassDescription [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
TypParametricType class >> classDescription: aClassDescription bindings: anOrderedDictionary [
	^ self new
		initializeWithClassDescription: aClassDescription
			bindings: anOrderedDictionary;
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricType class >> classDescription: aClassDescription bindings: anOrderedDictionary someSuperTypeBindings: anotherOrderedDictionary [
	^ self new
		initializeWithClassDescription: aClassDescription
			bindings: anOrderedDictionary
			someSuperTypeBindings: anotherOrderedDictionary;
		yourself
]

{ #category : #'as yet unclassified' }
TypParametricType class >> classDescription: aClassDescription superTypeBindings: anOrderedDictionary [
	self shouldNotImplement
]

{ #category : #'instance creation' }
TypParametricType class >> named: aString [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
TypParametricType class >> named: aString bindings: anOrderedDictionary [
	^ self new
		initializeWithName: aString bindings: anOrderedDictionary;
		yourself
]

{ #category : #comparing }
TypParametricType >> = aType [
	^ self == aType
		or: [ self class = aType class
				and: [ name = aType name
						and:
							[ parameters = aType parameters and: [ bindings = aType bindings ] ] ] ]
]

{ #category : #comparing }
TypParametricType >> > aType [
	^ (aType isParametric
		and: [ name = aType name
				and: [ parameters = aType parameters and: [ bindings > aType bindings ] ] ])
		or: [ super > aType ]
]

{ #category : #converting }
TypParametricType >> asCompatibleWith: aType [
	^ (aType isParametric
		and: [ name = aType name and: [ parameters = aType parameters ] ])
		ifTrue: [ self copyWithBindings: (bindings asCompatibleWith: aType bindings) ]
		ifFalse: [ super asCompatibleWith: aType ]
]

{ #category : #accessing }
TypParametricType >> bindingAt: aString [
	self flag: 'FIXME get rid of this'.
	^ bindings at: aString
]

{ #category : #accessing }
TypParametricType >> bindings [
	^ bindings
]

{ #category : #copying }
TypParametricType >> copyWithBindings: aBindings [
	^ self hasClassDescription
		ifTrue: [ self copy
				initializeWithClassDescription: self classDescription
					bindings: aBindings;
				yourself ]
		ifFalse: [ self copy
				initializeWithName: name bindings: aBindings;
				yourself ]
]

{ #category : #copying }
TypParametricType >> copyWithSomeBindings: aDictionary [
	| bindings_ |
	self assert: [ bindings keys includesAll: aDictionary keys ].
	bindings_ := bindings copy.
	aDictionary keysAndValuesDo: [ :n :t | bindings_ at: n put: t ].
	^ self copyWithBindings: bindings_
]

{ #category : #comparing }
TypParametricType >> hash [
	^ (super hash bitXor: bindings hash) bitXor: parameters hash
]

{ #category : #accessing }
TypParametricType >> initializeWithClassDescription: aClassDescription bindings: anOrderedDictionary [
	self
		assert:
			[ aClassDescription isNotNil and: [ anOrderedDictionary isNotEmpty ] ].
	self initializeWithClassDescription: aClassDescription.
	bindings := anOrderedDictionary
]

{ #category : #initialization }
TypParametricType >> initializeWithClassDescription: aClassDescription bindings: aBindings someSuperTypeBindings: anotherBindings [
	self
		assert: [ (anotherBindings variables intersect: aBindings variables)
				allSatisfy: [ :e | e = (aBindings at: e) ] ].
	self
		initializeWithClassDescription: aClassDescription
		bindings: aBindings.
	superType := self superType copyWithSomeBindings: anotherBindings
]

{ #category : #initialization }
TypParametricType >> initializeWithClassDescription: aClassDescription superTypeBindings: anOrderedDictionary [
	self shouldNotImplement
]

{ #category : #accessing }
TypParametricType >> initializeWithName: aString bindings: anOrderedDictionary [
	self
		assert: [ aString isNotEmpty and: [ anOrderedDictionary isNotEmpty ] ].
	self initializeWithName: aString.
	bindings := anOrderedDictionary
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
	bindings := bindings copy
]

{ #category : #printing }
TypParametricType >> printOn: aStream [
	super printOn: aStream.
	aStream << '<'.
	parameters
		withIndexDo: [ :e :i | 
			(bindings at: e) printOn: aStream.
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
				copyWithSomeBindings:
					((parameters select: [ :e | superType parameters includes: e ])
						collect: [ :e | e -> (bindings at: e) ]) typAsTypeVariableBindings ].
	^ superType
]
