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
TypFunctionType class >> classDescription: aClassDescription parameters: aSequenceableCollection [

	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: anotherBoolean [

	| parameters |
	parameters := OrderedDictionary new.
	parameters at: #'0' put: aType.
	aCollection withIndexDo: [ :e :i | 
		parameters at: i asString asSymbol put: e ].
	^ self new
		  initializeClassDescription: aClassDescription;
		  initializeParameters: parameters;
		  initializeArgumentsSize: parameters size - 1
		  argumentsOptional: aBoolean
		  signalsAlways: anotherBoolean;
		  yourself
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: anotherBoolean super: anotherType [

	| parameters |
	parameters := OrderedDictionary new.
	parameters at: #'0' put: aType.
	aCollection withIndexDo: [ :e :i | 
		parameters at: i asString asSymbol put: e ].
	^ self new
		  initializeClassDescription: aClassDescription;
		  initializeParameters: parameters;
		  initializeArgumentsSize: parameters size - 1
		  argumentsOptional: aBoolean
		  signalsAlways: anotherBoolean;
		  initializeSuper: anotherType;
		  yourself
]

{ #category : #accessing }
TypFunctionType class >> named: aString parameters: aSequenceableCollection [

	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> named: aString result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: anotherBoolean [

	| parameters |
	parameters := OrderedDictionary new.
	parameters at: #'0' put: aType.
	aCollection withIndexDo: [ :e :i | 
		parameters at: i asString asSymbol put: e ].
	^ self new
		  initializeName: aString;
		  initializeParameters: parameters;
		  initializeArgumentsSize: parameters size - 1
		  argumentsOptional: aBoolean
		  signalsAlways: anotherBoolean;
		  yourself
]

{ #category : #accessing }
TypFunctionType class >> named: aString result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: anotherBoolean super: anotherType [

	| parameters |
	parameters := OrderedDictionary new.
	parameters at: #'0' put: aType.
	aCollection withIndexDo: [ :e :i | 
		parameters at: i asString asSymbol put: e ].
	^ self new
		  initializeName: aString;
		  initializeParameters: parameters;
		  initializeArgumentsSize: parameters size - 1
		  argumentsOptional: aBoolean
		  signalsAlways: anotherBoolean;
		  initializeSuper: anotherType;
		  yourself
]

{ #category : #comparing }
TypFunctionType >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	argumentsSize = anObject argumentsSize ifFalse: [ ^ false ].
	^ argumentsOptional = anObject argumentsOptional
]

{ #category : #comparing }
TypFunctionType >> > aType [
	aType = self
		ifTrue: [ ^ false ].
	(aType class inheritsFrom: self class)
		ifTrue: [ ^ self >= (aType as: self class) ].
	(aType isFunction and: [ aType name = name ])
		ifFalse: [ ^ super > aType ].
	aType result > self result
		ifTrue: [ ^ false ].
	argumentsOptional
		ifTrue: [ | size |
			size := argumentsSize min: aType argumentsSize.
			size = 0
				ifTrue: [ ^ true ].
			^ (1 to: size)
				allSatisfy: [ :e | (self arguments at: e) >= (aType arguments at: e) ] ].
	aType argumentsOptional
		ifTrue: [ ^ false ].
	argumentsSize = aType argumentsSize
		ifFalse: [ ^ false ].
	^ (1 to: argumentsSize)
		allSatisfy: [ :e | (self arguments at: e) >= (aType arguments at: e) ]
]

{ #category : #compatibility }
TypFunctionType >> arguments [

	<typPraResult: 'SequenceableCollection<TypType>'>
	^ argumentsSize typTimesCollect: [ :i | self at: i asString asSymbol ]
]

{ #category : #accessing }
TypFunctionType >> argumentsOptional [
	^ argumentsOptional
]

{ #category : #accessing }
TypFunctionType >> argumentsSize [
	^ argumentsSize
]

{ #category : #comparing }
TypFunctionType >> hashSkipping: anIdentitySet [

	(anIdentitySet includes: self) ifTrue: [ ^ 41 ].
	^ ((41 bitXor: argumentsSize hash) bitXor: argumentsOptional hash) 
		  bitXor: (super hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypFunctionType >> initialize [

	<typPraVariable: 'argumentsSize' as: 'Integer'>
	<typPraVariable: 'argumentsOptional' as: 'Boolean'>
	super initialize.
	argumentsOptional := false
]

{ #category : #initialization }
TypFunctionType >> initializeArgumentsSize: anInteger argumentsOptional: aBoolean signalsAlways: anotherBoolean [

	self assert: [ anInteger isInteger ].
	self assert: [ anInteger >= 0 ].
	argumentsSize := anInteger.
	argumentsOptional := aBoolean.
	signalsAlways := anotherBoolean.
	hash := nil
]

{ #category : #initialization }
TypFunctionType >> initializeParameters: anOrderedDictionary [
	self
		assert: [ anOrderedDictionary associations
				allSatisfy: [ :e | 
					e key = #'0'
						or: [ e value isVariable not or: [ e value name ~= #'0' ] ] ] ].
	super initializeParameters: anOrderedDictionary
]

{ #category : #testing }
TypFunctionType >> isFunction [
	^ true
]

{ #category : #printing }
TypFunctionType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream
		<<
			(argumentsOptional
				ifTrue: [ '[' ]
				ifFalse: [ '(' ]).
	(1 to: argumentsSize)
		do: [ :i | 
			(self arguments at: i) printOn: aStream skipping: anIdentitySet , {self}.
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

{ #category : #compatibility }
TypFunctionType >> result [
	<typPraResult: 'TypType'>
	^ self at: #'0'
]

{ #category : #accessing }
TypFunctionType >> signalsAlways [
	^ signalsAlways
]

{ #category : #converting }
TypFunctionType >> withArguments: someTypes [

	^ self withParameters: { self result } , someTypes
]

{ #category : #converting }
TypFunctionType >> withParameters: aCollection [

	self hasClassDescription ifTrue: [ 
		^ self class
			  classDescription: self classDescription
			  result: aCollection first
			  arguments: aCollection allButFirst
			  argumentsOptional: argumentsOptional
			  signalsAlways: signalsAlways
			  super: self superOrNil ].
	^ self class
		  named: name
		  result: aCollection first
		  arguments: aCollection allButFirst
		  argumentsOptional: argumentsOptional
		  signalsAlways: signalsAlways
		  super: self superOrNil
]

{ #category : #converting }
TypFunctionType >> withResult: aType [

	^ self withAt: #'0' put: aType
]

{ #category : #converting }
TypFunctionType >> withSignalsAlways: aBooleanOrNil [

	self hasClassDescription ifTrue: [ 
		^ self class
			  classDescription: self classDescription
			  result: self result
			  arguments: self arguments
			  argumentsOptional: argumentsOptional
			  signalsAlways: aBooleanOrNil
			  super: self superOrNil ].
	^ self class
		  named: name
		  result: self result
		  arguments: self arguments
		  argumentsOptional: argumentsOptional
		  signalsAlways: aBooleanOrNil
		  super: self superOrNil
]

{ #category : #converting }
TypFunctionType >> withSuper: aType [

	self hasClassDescription ifTrue: [ 
		^ self class
			  classDescription: self classDescription
			  result: self result
			  arguments: self arguments
			  argumentsOptional: argumentsOptional
			  signalsAlways: signalsAlways
			  super: aType ].
	^ self class
		  named: name
		  result: self result
		  arguments: self arguments
		  argumentsOptional: argumentsOptional
		  signalsAlways: signalsAlways
		  super: aType
]
