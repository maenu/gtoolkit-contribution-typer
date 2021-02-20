Class {
	#name : #TypFunctionType,
	#superclass : #TypParametricType,
	#instVars : [
		'argumentsSize',
		'argumentsOptional',
		'signalsAlways'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription argumentsSize: anInteger argumentsOptional: aBoolean parameters: anOrderedDictionary [
	^ self new
		initializeClassDescription: aClassDescription;
		initializeParameters: anOrderedDictionary;
		initializeArgumentsSize: anInteger argumentsOptional: aBoolean;
		yourself
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription parameters: aSequenceableCollection [
	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription result: aType arguments: anOrderedCollection argumentsOptional: aBoolean signalsAlways: anotherBoolean [
	| parameters |
	parameters := OrderedDictionary new.
	parameters at: '@0' put: aType.
	anOrderedCollection
		withIndexDo: [ :e :i | parameters at: '@' , i asString put: e ].
	^ self new
		initializeClassDescription: aClassDescription;
		initializeParameters: parameters;
		initializeArgumentsSize: parameters size - 1
			argumentsOptional: aBoolean
			signalsAlways: anotherBoolean;
		yourself
]

{ #category : #accessing }
TypFunctionType class >> named: aString parameters: aSequenceableCollection [
	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> named: aString result: aType arguments: anOrderedCollection argumentsOptional: aBoolean signalsAlways: anotherBoolean [
	| parameters |
	parameters := OrderedDictionary new.
	parameters at: '@0' put: aType.
	anOrderedCollection
		withIndexDo: [ :e :i | parameters at: '@' , i asString put: e ].
	^ self new
		initializeName: aString;
		initializeParameters: parameters;
		initializeArgumentsSize: parameters size - 1
			argumentsOptional: aBoolean
			signalsAlways: anotherBoolean;
		yourself
]

{ #category : #comparing }
TypFunctionType >> = aType [
	^ super = aType
		and: [ argumentsSize = aType argumentsSize
				and: [ argumentsOptional = aType argumentsOptional ] ]
]

{ #category : #comparing }
TypFunctionType >> > aType [
	^ self ~= aType
		and: [ (aType isFunction
				and: [ name = aType name
						and: [ self result >= aType result
								and: [ (argumentsOptional not
										and: [ aType argumentsOptional not
												and: [ argumentsSize = aType argumentsSize
														and: [ (self arguments with: aType arguments collect: [ :a :b | a >= b ])
																allSatisfy: #yourself ] ] ])
										or: [ argumentsOptional
												and: [ | size |
													size := argumentsSize min: aType argumentsSize.
													size = 0
														or: [ ((self arguments copyFrom: 1 to: size)
																with: (aType arguments copyFrom: 1 to: size)
																collect: [ :a :b | a >= b ]) allSatisfy: #yourself ] ] ] ] ] ])
				or: [ super > aType ] ]
]

{ #category : #accessing }
TypFunctionType >> arguments [
	<typTypeResultAs: 'SequenceableCollection<TypType>'>
	^ (1 to: argumentsSize)
		withIndexCollect: [ :e :i | self at: '@' , i asString ]
]

{ #category : #accessing }
TypFunctionType >> argumentsOptional [
	^ argumentsOptional
]

{ #category : #accessing }
TypFunctionType >> argumentsSize [
	^ argumentsSize
]

{ #category : #converting }
TypFunctionType >> asCompatibleWith: aType [
	| copy |
	(aType isFunction
		and: [ argumentsSize = aType argumentsSize
				and: [ argumentsOptional = aType argumentsOptional ] ])
		ifFalse: [ ^ super asCompatibleWith: aType ].
	copy := self copy.
	parameters
		keysAndValuesDo: [ :n :t | copy at: n put: (t asCompatibleWith: (aType at: n)) ].
	^ copy
]

{ #category : #comparing }
TypFunctionType >> hash [
	^ (super hash bitXor: argumentsSize hash)
		bitXor: argumentsOptional hash
]

{ #category : #initialization }
TypFunctionType >> initialize [
	<typTypeVariable: 'argumentsSize' as: 'Integer'>
	<typTypeVariable: 'argumentsOptional' as: 'Boolean'>
	super initialize
]

{ #category : #initialization }
TypFunctionType >> initializeArgumentsSize: anInteger argumentsOptional: aBoolean signalsAlways: anotherBoolean [
	self assert: [ anInteger isInteger ].
	self assert: [ anInteger >= 0 ].
	argumentsSize := anInteger.
	argumentsOptional := aBoolean.
	signalsAlways := anotherBoolean
]

{ #category : #initialization }
TypFunctionType >> initializeParameters: anOrderedDictionary [
	self
		assert: [ anOrderedDictionary associations
				allSatisfy: [ :e | 
					e key = '@0'
						or: [ e value isVariable not or: [ e value name ~= '@0' ] ] ] ].
	super initializeParameters: anOrderedDictionary
]

{ #category : #testing }
TypFunctionType >> isFunction [
	^ true
]

{ #category : #accessing }
TypFunctionType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << name asString.
	aStream
		<<
			(argumentsOptional
				ifTrue: [ '[' ]
				ifFalse: [ '(' ]).
	self arguments
		withIndexDo: [ :e :i | 
			e printOn: aStream skipping: anIdentitySet , {self}.
			i < argumentsSize
				ifTrue: [ aStream << ',' ] ].
	aStream
		<<
			(argumentsOptional
				ifTrue: [ ']' ]
				ifFalse: [ ')' ]).
	aStream << '->'.
	self result printOn: aStream skipping: anIdentitySet , {self}
]

{ #category : #accessing }
TypFunctionType >> result [
	<typTypeResultAs: 'TypType'>
	^ self at: '@0'
]

{ #category : #accessing }
TypFunctionType >> signalsAlways [
	^ signalsAlways
]
