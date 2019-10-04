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

{ #category : #comparing }
TypFunctionType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | type |
					type := anObject "typCastAs TypFunctionType".
					arguments = type arguments and: [ optionalArguments = type optionalArguments and: [ result = type result ] ] ] ]
]

{ #category : #comparing }
TypFunctionType >> > aType [
	^ self ~= aType
		and: [ aType isFunction
				ifTrue: [ | type |
					type := aType "typCastAs TypFunctionType".
					result >= type result
						and: [ self hasArgumentsCompatibleWithThoseOf: type ] ]
				ifFalse: [ super > aType ] ]
]

{ #category : #accessing }
TypFunctionType >> arguments [
	<typTypeResultAs: 'OrderedCollection<TypType>'>
	^ arguments
]

{ #category : #accessing }
TypFunctionType >> arguments: anObject [
	<typTypeArgument: 1 as: 'SequenceableCollection<TypType>'>
	arguments := anObject asOrderedCollection
]

{ #category : #comparing }
TypFunctionType >> hasArgumentsCompatibleWithThoseOf: aType [
	<typTypeArgument: 1 as: 'TypFunctionType'>
	<typTypeResultAs: 'Boolean'>
	| size |
	size := optionalArguments
		ifTrue: [ aType arguments size ]
		ifFalse: [ arguments size ].
	^ size = 0
		or: [ size <= arguments size
				and: [ size <= aType arguments size
						and: [ ((arguments copyFrom: 1 to: size)
								withIndexSelect: [ :e :i | e >= (aType arguments at: i) ])
								size = size ] ] ]
]

{ #category : #comparing }
TypFunctionType >> hash [
	^ (super hash bitXor: optionalArguments hash) bitXor: result hash
]

{ #category : #accessing }
TypFunctionType >> initialize [
	<typTypeVariable: 'optionalParameters' as: 'Boolean'>
	<typTypeVariable: 'result' as: 'TypType'>
	super initialize.
	optionalArguments := false
]

{ #category : #testing }
TypFunctionType >> isFunction [
	^ true
]

{ #category : #accessing }
TypFunctionType >> optionalArguments [
	<typTypeResultAs: 'Boolean'>
	^ optionalArguments
]

{ #category : #accessing }
TypFunctionType >> optionalArguments: anObject [
	<typTypeArgument: 1 as: 'Boolean'>
	optionalArguments := anObject
]

{ #category : #copying }
TypFunctionType >> postCopy [
	super postCopy.
	result := result copy.
]

{ #category : #accessing }
TypFunctionType >> printOn: aStream [
	aStream << name asString.
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
TypFunctionType >> result: anObject [
	<typTypeArgument: 1 as: 'TypType'>
	result := anObject
]

{ #category : #accessing }
TypFunctionType >> superType [
	| superType |
	superType := super superType.
	^ superType isFunction
		ifTrue: [ (superType "typCastAs TypFunctionType") copy
				result: result copy;
				yourself ]
		ifFalse: [ superType ]
]
