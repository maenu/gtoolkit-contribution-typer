Class {
	#name : #TypFunctionType,
	#superclass : #TypType,
	#instVars : [
		'result',
		'arguments',
		'optionalArguments'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #'as yet unclassified' }
TypFunctionType class >> arguments: aCollection result: aType optionalArguments: aBoolean [
	^ self new
		initializeWithArguments: aCollection
			result: aType
			optionalArguments: aBoolean;
		yourself
]

{ #category : #comparing }
TypFunctionType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | type |
					type := anObject "typCastAs TypFunctionType".
					arguments = type arguments and: [ result = type result and: [ optionalArguments = type optionalArguments ] ] ] ]
]

{ #category : #comparing }
TypFunctionType >> > aType [
	^ self ~= aType
		and: [ aType isFunction
				and: [ (optionalArguments not or: [ aType optionalArguments ])
						and: [ arguments = aType arguments
								and: [ result >= aType result
										and: [ optionalArguments ~= aType optionalArguments
												or: [ result > aType result ] ] ] ] ] ]
]

{ #category : #accessing }
TypFunctionType >> arguments [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ arguments copy
]

{ #category : #converting }
TypFunctionType >> asCompatibleWith: aType [
	^ (self > aType or: [ aType > self ])
		ifTrue: [ self class
				arguments: arguments copy
				result: (result asCompatibleWith: aType result)
				optionalArguments: (optionalArguments and: aType optionalArguments) ]
		ifFalse: [ super asCompatibleWith: aType ]
]

{ #category : #'as yet unclassified' }
TypFunctionType >> canUnderstand: aSymbol [
	^ false
]

{ #category : #copying }
TypFunctionType >> copyWithResult: aType [
	^ self copy
		initializeWithArguments: (arguments collect: #copy)
			result: aType
			optionalArguments: optionalArguments;
		yourself
]

{ #category : #testing }
TypFunctionType >> hasSuperType [
	^ result hasSuperType
]

{ #category : #comparing }
TypFunctionType >> hash [
	^ ((super hash bitXor: arguments hash) bitXor: result hash)
		bitXor: optionalArguments hash
]

{ #category : #accessing }
TypFunctionType >> initialize [
	<typTypeVariable: 'optionalParameters' as: 'Boolean'>
	<typTypeVariable: 'result' as: 'TypType'>
	super initialize
]

{ #category : #initialization }
TypFunctionType >> initializeWithArguments: aCollection result: aType optionalArguments: aBoolean [
	arguments := aCollection.
	result := aType.
	optionalArguments := aBoolean
]

{ #category : #testing }
TypFunctionType >> isFunction [
	^ true
]

{ #category : #'as yet unclassified' }
TypFunctionType >> lookupSelector: aSymbol [
	self shouldNotImplement
]

{ #category : #accessing }
TypFunctionType >> optionalArguments [
	<typTypeResultAs: 'Boolean'>
	^ optionalArguments
]

{ #category : #copying }
TypFunctionType >> postCopy [
	super postCopy.
	arguments := arguments collect: #copy.
	result := result copy
]

{ #category : #accessing }
TypFunctionType >> printOn: aStream [
	aStream
		<<
			(optionalArguments
				ifTrue: [ '[' ]
				ifFalse: [ '(' ]).
	1 to: arguments size do: [ :i | 
		(arguments at: i) printOn: aStream.
		i < arguments size
			ifTrue: [ aStream << ',' ] ].
	aStream
		<<
			(optionalArguments
				ifTrue: [ ']' ]
				ifFalse: [ ')' ]).
	aStream << '->'.
	result printOn: aStream
]

{ #category : #accessing }
TypFunctionType >> result [
	<typTypeResultAs: 'TypType'>
	^ result
]

{ #category : #accessing }
TypFunctionType >> superType [
	self assert: [ self hasSuperType ].
	superType ifNotNil: [ ^ superType ].
	^ superType := self copyWithResult: result superType
]
