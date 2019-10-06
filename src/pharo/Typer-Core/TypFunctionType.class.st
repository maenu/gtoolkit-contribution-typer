Class {
	#name : #TypFunctionType,
	#superclass : #TypType,
	#instVars : [
		'argumentsSize',
		'argumentsOptional',
		'bindings'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'as yet unclassified' }
TypFunctionType class >> argumentsSize: anInteger argumentsOptional: aBoolean bindings: aBindings [
	^ self new
		initializeWithArgumentsSize: anInteger
			argumentsOptional: aBoolean
			bindings: aBindings;
		yourself
]

{ #category : #comparing }
TypFunctionType >> = aType [
	^ self == aType
		or: [ self class = aType class
				and: [ argumentsSize = aType argumentsSize
						and: [ argumentsOptional = aType argumentsOptional
								and: [ bindings = aType bindings ] ] ] ]
]

{ #category : #comparing }
TypFunctionType >> > aType [
	^ self ~= aType
		and: [ aType isFunction
				and: [ argumentsSize = aType argumentsSize
						and: [ argumentsOptional = aType argumentsOptional
								and: [ (bindings copyWithout: '@0' typAsType)
										>= (aType bindings copyWithout: '@0' typAsType)
										and: [ self result <= aType result ] ] ] ] ]
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
				and: [ argumentsOptional = aType argumentsOptional ] ])
		ifTrue:
			[ self copyWithBindings: (bindings asCompatibleWith: aType bindings) ]
		ifFalse: [ super asCompatibleWith: aType ]
]

{ #category : #accessing }
TypFunctionType >> bindings [
	^ bindings
]

{ #category : #'as yet unclassified' }
TypFunctionType >> canUnderstand: aSymbol [
	^ false
]

{ #category : #copying }
TypFunctionType >> copyWithBindings: aBindings [
	^ self copy
		initializeWithArgumentsSize: argumentsSize
			argumentsOptional: argumentsOptional
			bindings: aBindings;
		yourself
]

{ #category : #copying }
TypFunctionType >> copyWithResult: aType [
	^ self
		copyWithBindings:
			(bindings copy
				at: '@0' typAsType put: aType;
				yourself)
]

{ #category : #testing }
TypFunctionType >> hasSuperType [
	^ self result hasSuperType
]

{ #category : #comparing }
TypFunctionType >> hash [
	^ ((super hash bitXor: argumentsSize hash)
		bitXor: argumentsOptional hash) bitXor: bindings hash
]

{ #category : #initialization }
TypFunctionType >> initializeWithArgumentsSize: anInteger argumentsOptional: aBoolean bindings: aBindings [
	self
		assert: [ aBindings variables
				includesAll: ((0 to: anInteger) collect: [ :i | ('@' , i asString) typAsType ]) ].
	self
		assert: [ aBindings variables
				allSatisfy: [ :e | (aBindings at: e) ~= '@0' typAsType ] ].
	argumentsSize := anInteger.
	argumentsOptional := aBoolean.
	bindings := aBindings
]

{ #category : #testing }
TypFunctionType >> isFunction [
	^ true
]

{ #category : #'as yet unclassified' }
TypFunctionType >> lookupSelector: aSymbol [
	self shouldNotImplement
]

{ #category : #copying }
TypFunctionType >> postCopy [
	super postCopy.
	bindings := bindings copy
]

{ #category : #accessing }
TypFunctionType >> printOn: aStream [
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

{ #category : #accessing }
TypFunctionType >> superType [
	self assert: [ self hasSuperType ].
	superType ifNotNil: [ ^ superType ].
	^ superType := self copyWithResult: self result superType
]
