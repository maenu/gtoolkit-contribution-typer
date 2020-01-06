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
TypFunctionType class >> classDescription: aClassDescription argumentsSize: anInteger argumentsOptional: aBoolean [
	<typTypeArgument: 2 as: 'Integer'>
	^ self
		classDescription: aClassDescription
		argumentsSize: anInteger
		argumentsOptional: aBoolean
		bindings:
			((0 to: anInteger)
				collect:
					[ :e | ('@' , e asString) -> ('@' , e asString) typAsTypeVariableType ])
				asDictionary
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription argumentsSize: anInteger argumentsOptional: aBoolean bindings: aBindings [
	^ self new
		initializeWithClassDescription: aClassDescription
			argumentsSize: anInteger
			argumentsOptional: aBoolean
			bindings: aBindings;
		yourself
]

{ #category : #'as yet unclassified' }
TypFunctionType class >> classDescription: aClassDescription parameters: aSequenceableCollection [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
TypFunctionType class >> classDescription: aClassDescription parameters: aSequenceableCollection bindings: aBindings [
	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> named: aString argumentsSize: anInteger argumentsOptional: aBoolean [
	<typTypeArgument: 2 as: 'Integer'>
	^ self
		named: aString
		argumentsSize: anInteger
		argumentsOptional: aBoolean
		bindings:
			((0 to: anInteger)
				collect:
					[ :e | ('@' , e asString) -> ('@' , e asString) typAsTypeVariableType ])
				asDictionary
]

{ #category : #accessing }
TypFunctionType class >> named: aString argumentsSize: anInteger argumentsOptional: aBoolean bindings: aBindings [
	^ self new
		initializeWithName: aString
			argumentsSize: anInteger
			argumentsOptional: aBoolean
			bindings: aBindings;
		yourself
]

{ #category : #'as yet unclassified' }
TypFunctionType class >> named: aString parameters: aSequenceableCollection [
	self shouldNotImplement
]

{ #category : #'as yet unclassified' }
TypFunctionType class >> named: aString parameters: aSequenceableCollection bindings: aBindings [
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
	^ self hasClassDescription
		ifTrue: [ self copy
				initializeWithClassDescription: self classDescription
					argumentsSize: argumentsSize
					argumentsOptional: argumentsOptional
					bindings: aDictionary;
				yourself ]
		ifFalse: [ self copy
				initializeWithName: name
					argumentsSize: argumentsSize
					argumentsOptional: argumentsOptional
					bindings: aDictionary;
				yourself ]
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
TypFunctionType >> initializeArgumentsSize: anInteger argumentsOptional: aBoolean [
	<typTypeArgument: 1 as: 'Integer'>
	<typTypeArgument: 2 as: 'Boolean'>
	argumentsSize := anInteger.
	argumentsOptional := aBoolean
]

{ #category : #initialization }
TypFunctionType >> initializeWithClassDescription: aClassDescription argumentsSize: anInteger argumentsOptional: aBoolean bindings: aDictionary [
	<typTypeArgument: 2 as: 'Integer'>
	self
		assert: [ aDictionary associations
				allSatisfy: [ :e | 
					e key = '@0'
						or: [ e value isTypeVariable not or: [ e value name ~= '@0' ] ] ] ].
	self
		initializeWithClassDescription: aClassDescription
		parameters: ((0 to: anInteger) collect: [ :e | '@' , e asString ])
		bindings: aDictionary.
	self initializeArgumentsSize: anInteger argumentsOptional: aBoolean
]

{ #category : #initialization }
TypFunctionType >> initializeWithName: aString argumentsSize: anInteger argumentsOptional: aBoolean bindings: aDictionary [
	<typTypeArgument: 2 as: 'Integer'>
	self
		assert: [ aDictionary associations
				allSatisfy: [ :e | 
					e key = '@0'
						or: [ e value isTypeVariable not or: [ e value name ~= '@0' ] ] ] ].
	self
		initializeWithName: aString
		parameters: ((0 to: anInteger) collect: [ :e | '@' , e asString ])
		bindings: aDictionary.
	self initializeArgumentsSize: anInteger argumentsOptional: aBoolean
]

{ #category : #testing }
TypFunctionType >> isFunction [
	^ true
]

{ #category : #accessing }
TypFunctionType >> printOn: aStream [
	aStream << name asString.
	aStream
		<<
			(argumentsOptional
				ifTrue: [ '[' ]
				ifFalse: [ '(' ]).
	self arguments
		withIndexDo: [ :e :i | 
			e printOn: aStream.
			i < argumentsSize
				ifTrue: [ aStream << ',' ] ].
	aStream
		<<
			(argumentsOptional
				ifTrue: [ ']' ]
				ifFalse: [ ')' ]).
	aStream << '->'.
	self result printOn: aStream
]

{ #category : #accessing }
TypFunctionType >> result [
	<typTypeResultAs: 'TypType'>
	^ self at: '@0'
]
