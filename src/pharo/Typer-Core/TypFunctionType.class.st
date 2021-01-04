Class {
	#name : #TypFunctionType,
	#superclass : #TypParametricType,
	#instVars : [
		'argumentsSize',
		'argumentsOptional'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription argumentsSize: anInteger [
	^ self
		classDescription: aClassDescription
		argumentsSize: anInteger
		argumentsOptional: false
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription argumentsSize: anInteger argumentsOptional: aBoolean [
	^ self
		classDescription: aClassDescription
		argumentsSize: anInteger
		argumentsOptional: aBoolean
		bindings:
			((0 to: anInteger)
				collect:
					[ :e | ('@' , e asString) -> ('@' , e asString) typAsVariableType ])
				asDictionary
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription argumentsSize: anInteger argumentsOptional: aBoolean bindings: aDictionary [
	^ self new
		initializeClassDescription: aClassDescription;
		initializeArgumentsSize: anInteger
			argumentsOptional: aBoolean
			bindings: aDictionary;
		yourself
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription parameters: aSequenceableCollection [
	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription parameters: aSequenceableCollection bindings: aDictionary [
	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> named: aString argumentsSize: anInteger [
	^ self
		named: aString
		argumentsSize: anInteger
		argumentsOptional: false
]

{ #category : #accessing }
TypFunctionType class >> named: aString argumentsSize: anInteger argumentsOptional: aBoolean [
	^ self
		named: aString
		argumentsSize: anInteger
		argumentsOptional: aBoolean
		bindings:
			((0 to: anInteger)
				collect:
					[ :e | ('@' , e asString) -> ('@' , e asString) typAsVariableType ])
				asDictionary
]

{ #category : #accessing }
TypFunctionType class >> named: aString argumentsSize: anInteger argumentsOptional: aBoolean bindings: aBindings [
	^ self new
		initializeName: aString;
		initializeArgumentsSize: anInteger
			argumentsOptional: aBoolean
			bindings: aBindings;
		yourself
]

{ #category : #accessing }
TypFunctionType class >> named: aString parameters: aSequenceableCollection [
	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> named: aString parameters: aSequenceableCollection bindings: aDictionary [
	self shouldNotImplement
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
	bindings
		keysAndValuesDo: [ :n :t | copy at: n put: (t asCompatibleWith: (aType at: n)) ].
	^ copy
]

{ #category : #copying }
TypFunctionType >> copyWithBindings: aDictionary [
	^ self copy
		initializeArgumentsSize: argumentsSize
			argumentsOptional: argumentsOptional
			bindings: aDictionary;
		yourself
]

{ #category : #copying }
TypFunctionType >> copyWithResult: aType [
	<typTypeArgument: 1 as: 'TypType'>
	^ self copyWithBindings: {('@0' -> aType)} asDictionary
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
TypFunctionType >> initializeArgumentsSize: anInteger argumentsOptional: aBoolean bindings: aDictionary [
	self assert: [ anInteger isInteger ].
	self assert: [ anInteger >= 0 ].
	self
		assert: [ aDictionary associations
				allSatisfy: [ :e | 
					e key = '@0'
						or: [ e value isVariable not or: [ e value name ~= '@0' ] ] ] ].
	self
		initializeParameters: ((0 to: anInteger) collect: [ :e | '@' , e asString ])
		bindings: aDictionary.
	argumentsSize := anInteger.
	argumentsOptional := aBoolean
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
