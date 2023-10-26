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
TypFunctionType class >> classDescription: aClassDescription result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil node: aNodeOrNil [
	| instance parameters |
	self assert: [ aTypeOrNil == nil or: [ aType isVoid ] ].
	self assert: [ aCollection noneSatisfy: #isVoid ].
	parameters := OrderedDictionary new.
	parameters at: #'0' put: aType.
	aCollection withIndexDo: [ :e :i | parameters at: i asString asSymbol put: e ].
	instance := self new
			initializeClassDescription: aClassDescription;
			initializeParameters: parameters;
			initializeArgumentsSize: parameters size - 1
				argumentsOptional: aBoolean
				signalsAlways: aTypeOrNil
				signalsMaybe: anotherTypeOrNil
				node: aNodeOrNil;
			yourself.
	^ self index
		at: {aClassDescription name.
				aType.
				aCollection asArray.
				aBoolean.
				aTypeOrNil.
				anotherTypeOrNil.
				aNodeOrNil.
				instance superOrNil}
		ifAbsentPut: [ instance ]
]

{ #category : #accessing }
TypFunctionType class >> classDescription: aClassDescription result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil node: aNodeOrNil super: anotherType [
	^ self index
		at: {aClassDescription name.
				aType.
				aCollection asArray.
				aBoolean.
				aTypeOrNil.
				anotherTypeOrNil.
				aNodeOrNil}
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
					signalsMaybe: anotherTypeOrNil
					node: aNodeOrNil;
				initializeSuper: anotherType;
				yourself ]
]

{ #category : #accessing }
TypFunctionType class >> named: aString parameters: aSequenceableCollection [

	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType class >> named: aString result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil node: aNodeOrNil [
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
				signalsMaybe: anotherTypeOrNil
				node: aNodeOrNil;
			yourself.
	^ self index
		at: {aString asString.
				aType.
				aCollection asArray.
				aBoolean.
				aTypeOrNil.
				anotherTypeOrNil.
				aNodeOrNil.
				instance superOrNil}
		ifAbsentPut: [ instance ]
]

{ #category : #accessing }
TypFunctionType class >> named: aString result: aType arguments: aCollection argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil node: aNodeOrNil super: anotherType [
	^ self index
		at: {aString asString.
				aType.
				aCollection asArray.
				aBoolean.
				aTypeOrNil.
				anotherTypeOrNil.
				aNodeOrNil.
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
					signalsMaybe: anotherTypeOrNil
					node: aNodeOrNil;
				initializeSuper: anotherType;
				yourself ]
]

{ #category : #comparing }
TypFunctionType >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	argumentsSize = anObject argumentsSize ifFalse: [ ^ false ].
	argumentsOptional = anObject argumentsOptional ifFalse: [ ^ false ].
	node = anObject node ifFalse: [ ^ false ].
	signalsAlways = anObject signalsAlways ifFalse: [ ^ false ].
	signalsMaybe = anObject signalsMaybe ifFalse: [ ^ false ].
	super = anObject ifFalse: [ ^ false ].
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
	| resultResult resultArguments resultArgumentsOptional resultSignalsAlways resultSignalsMaybe resultNode |
	(aType isFunction
		and: [ name = aType name and: [ argumentsSize = aType argumentsSize ] ])
		ifFalse: [ ^ super covariant: aType ].
	aType == self ifTrue: [ ^ self ].
	self isUnknownFunction ifTrue: [ ^ aType ].
	aType isUnknownFunction ifTrue: [ ^ self ].
	resultNode := ({node.
			aType node} asIdentitySet reject: #isNil)
			ifEmpty: nil
			ifNotEmpty: [ :c | 
				c size > 1
					ifTrue: [ ^ {self.
							aType} typAsType ]
					ifFalse: [ c anyOne ] ].
	resultResult := self result covariant: aType result.
	resultArguments := aType arguments.
	resultArguments := self arguments
			withIndexCollect: [ :t :i | t covariant: (resultArguments at: i) ].
	resultArgumentsOptional := argumentsOptional and: aType argumentsOptional.
	{signalsAlways.
		aType signalsAlways}
		detect: #isNil
		ifFound: [ resultSignalsAlways := {signalsAlways.
					aType signalsAlways}
					detect: #isNil
					ifFound: [ nil ]
					ifNone: [ {signalsAlways.
							aType signalsAlways} typAsType ].
			resultSignalsMaybe := ({signalsMaybe.
					aType signalsMaybe} reject: #isNil) ifEmpty: nil ifNotEmpty: #typAsType ]
		ifNone: [ resultSignalsAlways := nil.
			resultSignalsMaybe := ({signalsAlways.
					aType signalsAlways.
					signalsMaybe.
					aType signalsMaybe} reject: #isNil) ifEmpty: nil ifNotEmpty: #typAsType ].
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				result: resultResult
				arguments: resultArguments
				argumentsOptional: resultArgumentsOptional
				signalsAlways: resultSignalsAlways
				signalsMaybe: resultSignalsMaybe
				node: resultNode
				super: self superOrNil ].
	^ self class
		named: name
		result: resultResult
		arguments: resultArguments
		argumentsOptional: resultArgumentsOptional
		signalsAlways: resultSignalsAlways
		signalsMaybe: resultSignalsMaybe
		node: resultNode
		super: self superOrNil
]

{ #category : #accessing }
TypFunctionType >> dependsOnCompiledMethod: aCompiledMethod [
	(super dependsOnCompiledMethod: aCompiledMethod) ifTrue: [ ^ true ].
	self hasClassDescription ifFalse: [ ^ false ].
	node ifNil: [ ^ false ].
	^ node context home allChildren
		anySatisfy: [ :c | 
			c root node methodNode
				ifNil: [ false ]
				ifNotNil: [ :n | 
					self flag: 'FIXME compare may be broken for removed method'.
					n compiledMethod == aCompiledMethod ] ]
]

{ #category : #accessing }
TypFunctionType >> hasNode [
	^ node isNotNil
]

{ #category : #comparing }
TypFunctionType >> hashSkipping: anIdentitySet [
	(anIdentitySet includes: self) ifTrue: [ ^ 41 ].
	^ (((((41 bitXor: argumentsSize hash) bitXor: argumentsOptional hash)
		bitXor: signalsAlways hash) bitXor: signalsMaybe hash) bitXor: node hash)
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
TypFunctionType >> initializeArgumentsSize: anInteger argumentsOptional: aBoolean signalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil node: aNodeOrNil [
	self assert: [ anInteger isInteger ].
	self assert: [ anInteger >= 0 ].
	self assert: [ aNodeOrNil isNil or: [ aNodeOrNil class = TypInfBlock ] ].
	argumentsSize := anInteger.
	argumentsOptional := aBoolean.
	signalsAlways := aTypeOrNil.
	signalsMaybe := anotherTypeOrNil.
	node := aNodeOrNil.
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
TypFunctionType >> isUnknownFunction [
	node ifNotNil: [ ^ false ].
	signalsAlways ifNotNil: [ ^ false ].
	signalsMaybe ifNotNil: [ ^ false ].
	self result isUnknown ifFalse: [ ^ false ].
	(self arguments allSatisfy: #isUnknown) ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypFunctionType >> node [
	^ node
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
	^ self withParameters: {self result} , someTypes
]

{ #category : #accessing }
TypFunctionType >> withNode: aNode [
	node == aNode ifTrue: [ ^ self ].
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				result: self result
				arguments: self arguments
				argumentsOptional: argumentsOptional
				signalsAlways: signalsAlways
				signalsMaybe: signalsMaybe
				node: aNode
				super: self superOrNil ].
	^ self class
		named: name
		result: self result
		arguments: self arguments
		argumentsOptional: argumentsOptional
		signalsAlways: signalsAlways
		signalsMaybe: signalsMaybe
		node: aNode
		super: self superOrNil
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
				node: node
				super: self superOrNil ].
	^ self class
		named: name
		result: aCollection first
		arguments: aCollection allButFirst
		argumentsOptional: argumentsOptional
		signalsAlways: signalsAlways
		signalsMaybe: signalsMaybe
		node: node
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
	(signalsAlways = aTypeOrNil and: [ signalsMaybe = anotherTypeOrNil ])
		ifTrue: [ ^ self ].
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				result: self result
				arguments: self arguments
				argumentsOptional: argumentsOptional
				signalsAlways: aTypeOrNil
				signalsMaybe: anotherTypeOrNil
				node: node
				super: self superOrNil ].
	^ self class
		named: name
		result: self result
		arguments: self arguments
		argumentsOptional: argumentsOptional
		signalsAlways: aTypeOrNil
		signalsMaybe: anotherTypeOrNil
		node: node
		super: self superOrNil
]

{ #category : #converting }
TypFunctionType >> withSignalsAlways: aTypeOrNil signalsMaybe: anotherTypeOrNil node: aNodeOrNil [
	(signalsAlways = aTypeOrNil
		and: [ signalsMaybe = anotherTypeOrNil and: [ node = aNodeOrNil ] ])
		ifTrue: [ ^ self ].
	self hasClassDescription
		ifTrue: [ ^ self class
				classDescription: self classDescription
				result: self result
				arguments: self arguments
				argumentsOptional: argumentsOptional
				signalsAlways: aTypeOrNil
				signalsMaybe: anotherTypeOrNil
				node: aNodeOrNil
				super: self superOrNil ].
	^ self class
		named: name
		result: self result
		arguments: self arguments
		argumentsOptional: argumentsOptional
		signalsAlways: aTypeOrNil
		signalsMaybe: anotherTypeOrNil
		node: aNodeOrNil
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
				node: node
				super: aType ].
	^ self class
		named: name
		result: self result
		arguments: self arguments
		argumentsOptional: argumentsOptional
		signalsAlways: signalsAlways
		signalsMaybe: signalsMaybe
		node: node
		super: aType
]
