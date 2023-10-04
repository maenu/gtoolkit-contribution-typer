Class {
	#name : #TypFunctionType,
	#superclass : #TypParametricType,
	#instVars : [
		'argumentsSize',
		'argumentsOptional',
		'signalsAlways',
		'node',
		'signalsMaybe'
	],
	#category : #'Typer-Core-Core'
}

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription parameters: aSequenceableCollection [

	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil [
	| instance parameters |
	self assert: [ aTypeOrNil == nil or: [ aType isVoid ] ].
	parameters := OrderedDictionary new.
	parameters at: #'0' put: aType.
	aCollection withIndexDo: [ :e :i | parameters at: i asString asSymbol put: e ].
	instance := self new
			initializeClassDescription: aClassDescription;
			initializeParameters: parameters;
			initializeArgumentsSize: parameters size - 1
				argumentsOptional: aBoolean
				signalsAlways: aTypeOrNil
				signalsMaybe: anotherTypeOrNil;
			yourself.
	^ self index
		at: {aClassDescription name.
				aType.
				aCollection asArray.
				aBoolean.
				aTypeOrNil.
				anotherTypeOrNil.
				instance superOrNil}
		ifAbsentPut: [ instance ]
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil super: anotherType [
	^ self index
		at: {aClassDescription name.
				aType.
				aCollection asArray.
				aBoolean.
				aTypeOrNil.
				anotherTypeOrNil}
		ifAbsentPut: [ | parameters |
			parameters := OrderedDictionary new.
			parameters at: #'0' put: aType.
			aCollection
				withIndexDo: [ :e :i | parameters at: i asString asSymbol put: e ].
			self new
				initializeClassDescription: aClassDescription;
				initializeParameters: parameters;
				initializeArgumentsSize: parameters size - 1
					argumentsOptional: aBoolean
					signalsAlways: aTypeOrNil
					signalsMaybe: anotherTypeOrNil;
				initializeSuper: anotherType;
				yourself ]
]

{ #category : #accessing }
TypFunctionType class >> named: aString parameters: aSequenceableCollection [

	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> named: aString result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil [
	| instance parameters |
	self assert: [ aTypeOrNil == nil or: [ aType isVoid ] ].
	parameters := OrderedDictionary new.
	parameters at: #'0' put: aType.
	aCollection withIndexDo: [ :e :i | parameters at: i asString asSymbol put: e ].
	instance := self new
			initializeName: aString;
			initializeParameters: parameters;
			initializeArgumentsSize: parameters size - 1
				argumentsOptional: aBoolean
				signalsAlways: aTypeOrNil
				signalsMaybe: anotherTypeOrNil;
			yourself.
	^ self index
		at: {aString asString.
				aType.
				aCollection asArray.
				aBoolean.
				aTypeOrNil.
				anotherTypeOrNil.
				instance superOrNil}
		ifAbsentPut: [ instance ]
]

{ #category : #accessing }
TypFunctionType class >> named: aString result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil super: anotherType [
	^ self index
		at: {aString asString.
				aType.
				aCollection asArray.
				aBoolean.
				aTypeOrNil.
				anotherTypeOrNil.
				anotherType}
		ifAbsentPut: [ | parameters |
			parameters := OrderedDictionary new.
			parameters at: #'0' put: aType.
			aCollection
				withIndexDo: [ :e :i | parameters at: i asString asSymbol put: e ].
			self new
				initializeName: aString;
				initializeParameters: parameters;
				initializeArgumentsSize: parameters size - 1
					argumentsOptional: aBoolean
					signalsAlways: aTypeOrNil
					signalsMaybe: anotherTypeOrNil;
				initializeSuper: anotherType;
				yourself ]
]

{ #category : #comparing }
TypFunctionType >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	super = anObject ifFalse: [ ^ false ].
	argumentsSize = anObject argumentsSize ifFalse: [ ^ false ].
	argumentsOptional = anObject argumentsOptional ifFalse: [ ^ false ].
	node = anObject node ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
TypFunctionType >> > aType [
	aType = self ifTrue: [ ^ false ].
	(aType class inheritsFrom: self class)
		ifTrue: [ ^ self >= (aType as: self class) ].
	(aType isFunction and: [ aType name = name ]) ifFalse: [ ^ super > aType ].
	aType result > self result ifTrue: [ ^ false ].
	argumentsOptional
		ifTrue: [ | size |
			size := argumentsSize min: aType argumentsSize.
			size = 0 ifTrue: [ ^ true ].
			^ (1 to: size)
				allSatisfy: [ :e | (self arguments at: e) >= (aType arguments at: e) ] ].
	aType argumentsOptional ifTrue: [ ^ false ].
	argumentsSize = aType argumentsSize ifFalse: [ ^ false ].
	((1 to: argumentsSize)
		allSatisfy: [ :e | (self arguments at: e) >= (aType arguments at: e) ])
		ifFalse: [ ^ false ].
	(aType hasNode and: [ self hasNode not ]) ifTrue: [ ^ false ].
	(aType hasNode not and: [ self hasNode ]) ifTrue: [ ^ true ].
	node = aType node ifFalse: [ ^ false ].
	^ true
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

{ #category : #accessing }
TypFunctionType >> covariant: aType [
	| result |
	result := super covariant: aType.
	result isFunction ifFalse: [ ^ result ].
	aType isFunction ifFalse: [ ^ result ].
	result := {signalsAlways.
			result signalsAlways}
			detect: #isNil
			ifFound: [ result
					withSignalsAlways: ({signalsAlways.
							aType signalsAlways}
							detect: #isNil
							ifFound: [ nil ]
							ifNone: [ {signalsAlways.
									aType signalsAlways} typAsType ])
					signalsMaybe: (({signalsMaybe.
							aType signalsMaybe} reject: #isNil) ifEmpty: nil ifNotEmpty: #typAsType) ]
			ifNone: [ result
					withSignalsAlways: nil
					signalsMaybe: (({signalsAlways.
							aType signalsAlways.
							signalsMaybe.
							aType signalsMaybe} reject: #isNil) ifEmpty: nil ifNotEmpty: #typAsType) ].
	^ result
		withNode: (({node.
				result node} reject: #isNil) ifEmpty: nil ifNotEmpty: #first)
]

{ #category : #accessing }
TypFunctionType >> hasNode [
	^ node isNotNil
]

{ #category : #comparing }
TypFunctionType >> hashSkipping: anIdentitySet [
	(anIdentitySet includes: self) ifTrue: [ ^ 41 ].
	^ (((41 bitXor: argumentsSize hash) bitXor: argumentsOptional hash)
		bitXor: node hash) bitXor: (super hashSkipping: anIdentitySet)
]

{ #category : #initialization }
TypFunctionType >> initialize [

	<typPraVariable: 'argumentsSize' as: 'Integer'>
	<typPraVariable: 'argumentsOptional' as: 'Boolean'>
	super initialize.
	argumentsOptional := false
]

{ #category : #initialization }
TypFunctionType >> initializeArgumentsSize: anInteger argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil [
	self assert: [ anInteger isInteger ].
	self assert: [ anInteger >= 0 ].
	self assert: [ aTypeOrNil isNil or: anotherTypeOrNil isNil ].
	argumentsSize := anInteger.
	argumentsOptional := aBoolean.
	signalsAlways := aTypeOrNil.
	signalsMaybe := anotherTypeOrNil.
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

{ #category : #accessing }
TypFunctionType >> node [
	^ node
]

{ #category : #accessing }
TypFunctionType >> node: aNode [
	self assert: [ node isNil ] description: 'initialization only'.
	node := aNode
]

{ #category : #printing }
TypFunctionType >> printOn: aStream skipping: anIdentitySet [
	(anIdentitySet includes: self)
		ifTrue: [ aStream << '.'.
			^ self ].
	aStream << (argumentsOptional ifTrue: [ '[' ] ifFalse: [ '(' ]).
	1
		to: argumentsSize
		do: [ :i | 
			(self arguments at: i) printOn: aStream skipping: anIdentitySet , {self}.
			i < argumentsSize ifTrue: [ aStream << ',' ] ].
	aStream << (argumentsOptional ifTrue: [ ']' ] ifFalse: [ ')' ]).
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

{ #category : #accessing }
TypFunctionType >> signalsMaybe [
	^ signalsMaybe
]

{ #category : #converting }
TypFunctionType >> withArguments: someTypes [

	^ self withParameters: { self result } , someTypes
]

{ #category : #accessing }
TypFunctionType >> withNode: aNode [
	node ifNotNil: [ :n | n == aNode ifTrue: [ ^ self ] ].
	^ self copy
		node: aNode;
		yourself
]

{ #category : #converting }
TypFunctionType >> withParameters: aCollection [
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				result: aCollection first
				arguments: aCollection allButFirst
				argumentsOptional: argumentsOptional
				signalsAlways: signalsAlways
				signalsMaybe: signalsMaybe
				super: self superOrNil ].
	^ self class
		named: name
		result: aCollection first
		arguments: aCollection allButFirst
		argumentsOptional: argumentsOptional
		signalsAlways: signalsAlways
		signalsMaybe: signalsMaybe
		super: self superOrNil
]

{ #category : #converting }
TypFunctionType >> withResult: aType [

	^ self withAt: #'0' put: aType
]

{ #category : #converting }
TypFunctionType >> withSignalsAlways: aTypeOrNil [
	^ self withSignalsAlways: aTypeOrNil signalsMaybe: signalsMaybe
]

{ #category : #converting }
TypFunctionType >> withSignalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil [
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				result: self result
				arguments: self arguments
				argumentsOptional: argumentsOptional
				signalsAlways: aTypeOrNil
				signalsMaybe: anotherTypeOrNil
				super: self superOrNil ].
	^ self class
		named: name
		result: self result
		arguments: self arguments
		argumentsOptional: argumentsOptional
		signalsAlways: aTypeOrNil
		signalsMaybe: anotherTypeOrNil
		super: self superOrNil
]

{ #category : #converting }
TypFunctionType >> withSuper: aType [
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				result: self result
				arguments: self arguments
				argumentsOptional: argumentsOptional
				signalsAlways: signalsAlways
				signalsMaybe: signalsMaybe
				super: aType ].
	^ self class
		named: name
		result: self result
		arguments: self arguments
		argumentsOptional: argumentsOptional
		signalsAlways: signalsAlways
		signalsMaybe: signalsMaybe
		super: aType
]

{ #category : #converting }
TypFunctionType >> withoutNode [
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				result: self result
				arguments: self arguments
				argumentsOptional: argumentsOptional
				signalsAlways: signalsAlways
				signalsMaybe: signalsMaybe
				super: self superOrNil ].
	^ self class
		named: name
		result: self result
		arguments: self arguments
		argumentsOptional: argumentsOptional
		signalsAlways: signalsAlways
		signalsMaybe: signalsMaybe
		super: self superOrNil
]
