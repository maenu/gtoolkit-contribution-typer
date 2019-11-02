Class {
	#name : #TypFunctionType,
	#superclass : #TypParametricType,
	#instVars : [
		'argumentsSize',
		'argumentsOptional'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'as yet unclassified' }
TypFunctionType class >> classDescription: aClassDescription argumentsSize: anInteger argumentsOptional: aBoolean [
	^ self
		classDescription: aClassDescription
		argumentsSize: anInteger
		argumentsOptional: aBoolean
		bindings:
			(TypTypeVariableBindings
				variables: ((0 to: anInteger) collect: [ :e | ('@' , e asString) typAsType ]))
]

{ #category : #'as yet unclassified' }
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

{ #category : #'as yet unclassified' }
TypFunctionType class >> named: aString argumentsSize: anInteger argumentsOptional: aBoolean [
	^ self
		named: aString
		argumentsSize: anInteger
		argumentsOptional: aBoolean
		bindings:
			(TypTypeVariableBindings
				variables: ((0 to: anInteger) collect: [ :e | ('@' , e asString) typAsType ]))
]

{ #category : #'as yet unclassified' }
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
	^ self == aType
		or: [ self class = aType class
				and: [ name = aType name
						and: [ argumentsSize = aType argumentsSize
								and: [ argumentsOptional = aType argumentsOptional
										and:
											[ parameters = aType parameters and: [ bindings = aType bindings ] ] ] ] ] ]
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
		withIndexCollect: [ :e :i | bindings at: ('@' , i asString) typAsType ]
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
	^ (aType isFunction
		and: [ argumentsSize = aType argumentsSize
				and: [ argumentsOptional = aType argumentsOptional and: [ bindings variables = aType bindings variables ] ] ])
		ifTrue:
			[ self copyWithBindings: (bindings asCompatibleWith: aType bindings) ]
		ifFalse: [ super asCompatibleWith: aType ]
]

{ #category : #copying }
TypFunctionType >> copyWithBindings: aBindings [
	^ self hasClassDescription
		ifTrue: [ self copy
				initializeWithClassDescription: self classDescription
					argumentsSize: argumentsSize
					argumentsOptional: argumentsOptional
					bindings: aBindings;
				yourself ]
		ifFalse: [ self copy
				initializeWithName: name
					argumentsSize: argumentsSize
					argumentsOptional: argumentsOptional
					bindings: aBindings;
				yourself ]
]

{ #category : #copying }
TypFunctionType >> copyWithResult: aType [
	^ self
		copyWithBindings:
			(bindings copy
				at: '@0' typAsType put: aType;
				yourself)
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
	argumentsSize := anInteger.
	argumentsOptional := aBoolean
]

{ #category : #initialization }
TypFunctionType >> initializeWithClassDescription: aClassDescription argumentsSize: anInteger argumentsOptional: aBoolean bindings: aBindings [
	self
		assert: [ aBindings variables
				allSatisfy: [ :e | e = '@0' typAsType or: [ (aBindings at: e) ~= '@0' typAsType ] ] ].
	self
		initializeWithClassDescription: aClassDescription
		parameters: ((0 to: anInteger) collect: [ :e | ('@' , e asString) typAsType ])
		bindings: aBindings.
	self initializeArgumentsSize: anInteger argumentsOptional: aBoolean
]

{ #category : #initialization }
TypFunctionType >> initializeWithName: aString argumentsSize: anInteger argumentsOptional: aBoolean bindings: aBindings [
	self
		assert: [ aBindings variables
				allSatisfy: [ :e | e = '@0' typAsType or: [ (aBindings at: e) ~= '@0' typAsType ] ] ].
	self
		initializeWithName: aString
		parameters: ((0 to: anInteger) collect: [ :e | ('@' , e asString) typAsType ])
		bindings: aBindings.
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
	^ bindings at: '@0' typAsType
]
