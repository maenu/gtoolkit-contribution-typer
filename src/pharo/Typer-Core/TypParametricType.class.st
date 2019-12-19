Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'parameters',
		'bindings'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'instance creation' }
TypParametricType class >> classDescription: aClassDescription [
	self shouldNotImplement
]

{ #category : #accessing }
TypParametricType class >> classDescription: aClassDescription parameters: aSequenceableCollection [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeArgument: 2 as: 'SequenceableCollection<TypType>'>
	^ self
		classDescription: aClassDescription
		parameters: aSequenceableCollection
		bindings: (TypTypeVariableBindings variables: aSequenceableCollection asSet)
]

{ #category : #accessing }
TypParametricType class >> classDescription: aClassDescription parameters: aSequenceableCollection bindings: aBindings [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeArgument: 2 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 3 as: 'TypTypeVariableBindings'>
	^ self new
		initializeWithClassDescription: aClassDescription
			parameters: aSequenceableCollection
			bindings: aBindings;
		yourself
]

{ #category : #'instance creation' }
TypParametricType class >> named: aString [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
TypParametricType class >> named: aString parameters: aSequenceableCollection [
	^ self
		named: aString
		parameters: aSequenceableCollection
		bindings: (TypTypeVariableBindings variables: aSequenceableCollection asSet)
]

{ #category : #accessing }
TypParametricType class >> named: aString parameters: aSequenceableCollection bindings: aBindings [
	^ self new
		initializeWithName: aString
			parameters: aSequenceableCollection
			bindings: aBindings;
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
	^ self ~= aType
		and: [ (aType isParametric
				and: [ name = aType name
						and: [ parameters = aType parameters and: [ bindings >= aType bindings ] ] ])
				or: [ super > aType ] ]
]

{ #category : #converting }
TypParametricType >> asCompatibleWith: aType [
	^ (aType isParametric
		and: [ name = aType name
				and: [ bindings variables = aType bindings variables ] ])
		ifTrue: [ self copyWithBindings: (bindings asCompatibleWith: aType bindings) ]
		ifFalse: [ super asCompatibleWith: aType ]
]

{ #category : #accessing }
TypParametricType >> bindings [
	^ bindings
]

{ #category : #copying }
TypParametricType >> copyWithBindings: aBindings [
	<typTypeArgument: 1 as: 'TypTypeVariableBindings'>
	^ self hasClassDescription
		ifTrue: [ self copy
				initializeWithClassDescription: self classDescription
					parameters: parameters
					bindings: aBindings;
				yourself ]
		ifFalse: [ self copy
				initializeWithName: name
					parameters: parameters
					bindings: aBindings;
				yourself ]
]

{ #category : #copying }
TypParametricType >> copyWithSomeBindings: aBindings [
	<typTypeArgument: 1 as: 'TypTypeVariableBindings'>
	| bindings_ |
	self assert: [ bindings variables includesAll: aBindings variables ].
	bindings_ := bindings copy.
	bindings_ addAll: aBindings.
	^ self copyWithBindings: bindings_
]

{ #category : #comparing }
TypParametricType >> hash [
	^ (super hash bitXor: bindings hash) bitXor: parameters hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	<typTypeVariable: 'parameters' as: 'SequenceableCollection<TypTypeVariableType>'>
	<typTypeVariable: 'bindings' as: 'TypTypeVariableBindings'>
	super initialize
]

{ #category : #accessing }
TypParametricType >> initializeParameters: aSequenceableCollection bindings: aBindings [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	<typTypeArgument: 2 as: 'TypTypeVariableBindings'>
	self
		assert: [ aSequenceableCollection isNotEmpty
				and: [ aBindings variables includesAll: aSequenceableCollection asSet ] ].
	parameters := aSequenceableCollection asOrderedCollection.
	bindings := aBindings
]

{ #category : #accessing }
TypParametricType >> initializeWithClassDescription: aClassDescription parameters: aSequenceableCollection bindings: aBindings [
	self initializeWithClassDescription: aClassDescription.
	self
		initializeParameters: aSequenceableCollection
		bindings: aBindings
]

{ #category : #accessing }
TypParametricType >> initializeWithName: aString parameters: aSequenceableCollection bindings: aBindings [
	self initializeWithName: aString.
	self
		initializeParameters: aSequenceableCollection
		bindings: aBindings
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
	parameters := parameters copy.
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
