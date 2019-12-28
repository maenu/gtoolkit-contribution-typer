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
	<typTypeArgument: 2 as: 'SequenceableCollection<String>'>
	^ self
		classDescription: aClassDescription
		parameters: aSequenceableCollection
		bindings: Dictionary new
]

{ #category : #accessing }
TypParametricType class >> classDescription: aClassDescription parameters: aSequenceableCollection bindings: aDictionary [
	<typTypeArgument: 1 as: 'ClassDescription'>
	<typTypeArgument: 2 as: 'SequenceableCollection<String>'>
	<typTypeArgument: 3 as: 'Dictionary<String,TypType>'>
	^ self new
		initializeWithClassDescription: aClassDescription
			parameters: aSequenceableCollection
			bindings: aDictionary;
		yourself
]

{ #category : #'instance creation' }
TypParametricType class >> named: aString [
	self shouldNotImplement
]

{ #category : #accessing }
TypParametricType class >> named: aString parameters: aSequenceableCollection [
	^ self
		named: aString
		parameters: aSequenceableCollection
		bindings: Dictionary new
]

{ #category : #accessing }
TypParametricType class >> named: aString parameters: aSequenceableCollection bindings: aDictionary [
	^ self new
		initializeWithName: aString
			parameters: aSequenceableCollection
			bindings: aDictionary;
		yourself
]

{ #category : #comparing }
TypParametricType >> = aType [
	^ super = aType
		and: [ parameters = aType parameters
				and: [ parameters allSatisfy: [ :e | (self at: e) = (aType at: e) ] ] ]
]

{ #category : #comparing }
TypParametricType >> > aType [
	^ self ~= aType
		and: [ (aType isParametric
				and: [ name = aType name
						and: [ parameters = aType parameters
								and:
									[ parameters allSatisfy: [ :e | (self at: e) >= (aType at: e) ] ] ] ])
				or: [ super > aType ] ]
]

{ #category : #converting }
TypParametricType >> asCompatibleWith: aType [
	| copy |
	(aType isParametric
		and: [ name = aType name and: [ parameters = aType parameters ] ])
		ifFalse: [ ^ super asCompatibleWith: aType ].
	copy := self copy.
	bindings
		keysAndValuesDo: [ :n :t | copy at: n put: (t asCompatibleWith: (aType at: n)) ].
	^ copy
]

{ #category : #accessing }
TypParametricType >> at: aString [
	<typTypeArgument: 1 as: 'String'>
	^ bindings at: aString
]

{ #category : #accessing }
TypParametricType >> at: aString put: aType [
	<typTypeArgument: 1 as: 'String'>
	<typTypeArgument: 2 as: 'TypType'>
	^ bindings at: aString put: aType
]

{ #category : #accessing }
TypParametricType >> bindings [
	^ bindings
]

{ #category : #copying }
TypParametricType >> copyWithBindings: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<String,TypType>'>
	| bindings_ |
	bindings_ := (aDictionary associations
		collect: [ :e | 
			e key
				->
					((e value isTypeVariable and: [ e value type == self ])
						ifTrue: [ e value copy
								type: nil;
								yourself ]
						ifFalse: [ e value ]) ]) asDictionary.
	^ self hasClassDescription
		ifTrue: [ self copy
				initializeWithClassDescription: self classDescription
					parameters: parameters
					bindings: bindings_;
				yourself ]
		ifFalse: [ self copy
				initializeWithName: name
					parameters: parameters
					bindings: bindings_;
				yourself ]
]

{ #category : #copying }
TypParametricType >> copyWithSomeBindings: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<String,TypType>'>
	| bindings_ |
	self assert: [ parameters includesAll: aDictionary keys ].
	bindings_ := bindings copy.
	aDictionary keysAndValuesDo: [ :n :t | bindings_ at: n put: t ].
	^ self copyWithBindings: bindings_
]

{ #category : #comparing }
TypParametricType >> hash [
	^ (super hash bitXor: bindings hash) bitXor: parameters hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	<typTypeVariable: 'parameters' as: 'SequenceableCollection<TypTypeVariableType>'>
	<typTypeVariable: 'bindings' as: 'Dictionary<String,TypType>'>
	self flag: 'TODO how is shadowing of bindings handled?'.
	super initialize.
	bindings := Dictionary new "typParameters String,TypType".
]

{ #category : #accessing }
TypParametricType >> initializeParameters: aSequenceableCollection bindings: aDictionary [
	"Sets type to self on variables without type."

	<typTypeArgument: 2 as: 'SequenceableCollection<String>'>
	<typTypeArgument: 3 as: 'Dictionary<String,TypType>'>
	self assert: [ aSequenceableCollection isNotEmpty ].
	self
		assert: [ aSequenceableCollection asSet includesAll: aDictionary keys asSet ].
	parameters := aSequenceableCollection asOrderedCollection.
	bindings := aDictionary
		do: [ :e | 
			(e isTypeVariable and: [ e type isNil ])
				ifTrue: [ e type: self ] ];
		yourself.
	superType := nil
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
			(self at: e) printOn: aStream.
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
					((bindings keys select: [ :e | superType parameters includes: e ])
						collect: [ :e | e -> (self at: e) ]) asDictionary ].
	^ superType
]
