Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'bindings'
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
TypParametricType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypParametricType".
					name = object name and: [ self parameters = object parameters and: [ self parameters allSatisfy: [ :e | (self bindingAt: e) = (object bindingAt: e) ] ] ] ] ]
]

{ #category : #comparing }
TypParametricType >> > aType [
	^ super > aType
		and: [ self parameters = aType parameters
				and: [ self parameters
						allSatisfy: [ :e | 
							| a b |
							a := self bindingAt: e.
							b := aType bindingAt: e.
							a isTypeVariable
								ifTrue: [ b isTypeVariable
										ifTrue: [ a = b ]
										ifFalse: [ true ] ]
								ifFalse: [ a = b ] ] ] ]
]

{ #category : #accessing }
TypParametricType >> bindingAt: aString [
	^ bindings at: aString
]

{ #category : #copying }
TypParametricType >> copyWithBindings: anOrderedDictionary [
	self assert: [ bindings keys = anOrderedDictionary keys ].
	^ classDescription
		ifNil: [ self copy
				initializeWithName: name bindings: anOrderedDictionary;
				yourself ]
		ifNotNil: [ self copy
				initializeWithClassDescription: classDescription
					bindings: anOrderedDictionary;
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
	^ super hash bitXor: bindings hash
]

{ #category : #accessing }
TypParametricType >> initializeWithClassDescription: aClassDescription bindings: anOrderedDictionary [
	self
		assert: [ aClassDescription isNotNil and: [ anOrderedDictionary isNotEmpty ] ].
	self initializeWithClassDescription: aClassDescription.
	bindings := anOrderedDictionary copy
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
	^ bindings keys
]

{ #category : #copying }
TypParametricType >> postCopy [
	super postCopy.
	bindings := bindings collect: #copy
]

{ #category : #printing }
TypParametricType >> printOn: aStream [
	super printOn: aStream.
	aStream << '<'.
	1 to: bindings size do: [ :i | 
		(bindings at: (bindings keys at: i)) printOn: aStream.
		i < bindings size
			ifTrue: [ aStream << ',' ] ].
	aStream << '>'
]

{ #category : #accessing }
TypParametricType >> superType [
	superType := super superType.
	superType isParametric
		ifTrue: [ superType := superType
				copyWithSomeBindings:
					((self parameters select: [ :e | superType parameters includes: e ])
						collect: [ :e | e -> (self bindingAt: e) ]) asOrderedDictionary ].
	^ superType
]
