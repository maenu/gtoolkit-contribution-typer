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
	^ self
		classDescription: aClassDescription
		parameters: aSequenceableCollection
		bindings: Dictionary new
]

{ #category : #accessing }
TypParametricType class >> classDescription: aClassDescription parameters: aSequenceableCollection bindings: aDictionary [
	^ self new
		initializeClassDescription: aClassDescription;
		initializeParameters: aSequenceableCollection bindings: aDictionary;
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
		initializeName: aString;
		initializeParameters: aSequenceableCollection bindings: aDictionary;
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
	superType := nil. "must be nilled as change in binding might invalidate super type"
	^ bindings at: aString put: aType
]

{ #category : #accessing }
TypParametricType >> bindings [
	^ bindings
]

{ #category : #copying }
TypParametricType >> copyWithBindings: aDictionary [
	<typTypeArgument: 1 as: 'Dictionary<String,TypType>'>
	self assert: [ parameters includesAll: aDictionary keys ].
	^ self copy
		initializeParameters: parameters copy
			bindings:
			(bindings copy
				addAll: aDictionary;
				yourself);
		yourself
]

{ #category : #comparing }
TypParametricType >> hash [
	^ (super hash bitXor: bindings hash) bitXor: parameters hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	<typTypeVariable: 'parameters' as: 'SequenceableCollection<String>'>
	<typTypeVariable: 'bindings' as: 'Dictionary<String,TypType>'>
	self flag: 'TODO how is shadowing of bindings handled?'.
	super initialize.
	bindings := Dictionary new "typParameters String,TypType".
]

{ #category : #accessing }
TypParametricType >> initializeParameters: aSequenceableCollection bindings: aDictionary [
	<typTypeArgument: 1 as: 'SequenceableCollection<String>'>
	<typTypeArgument: 2 as: 'Dictionary<String,TypType>'>
	self assert: [ aSequenceableCollection isNotEmpty ].
	self
		assert: [ aSequenceableCollection asSet includesAll: aDictionary keys asSet ].
	parameters := aSequenceableCollection.
	bindings := aDictionary.
	parameters
		do: [ :e | 
			(bindings includesKey: e)
				ifFalse: [ bindings at: e put: e typAsVariableType ] ].
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
	parameters := parameters copy.
	bindings := bindings copy
]

{ #category : #printing }
TypParametricType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << name asString.
	aStream << '<'.
	parameters
		withIndexDo: [ :e :i | 
			(self at: e) printOn: aStream skipping: anIdentitySet , {self}.
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
				copyWithBindings:
					((bindings keys intersection: superType parameters)
						collect: [ :e | e -> (self at: e) ]) asDictionary ].
	^ superType
]
