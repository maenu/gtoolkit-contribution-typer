Class {
	#name : #TypFunctionType,
	#superclass : #TypParametricType,
	#instVars : [
		'optionalParameters',
		'result'
	],
	#category : #'Typer-Core'
}

{ #category : #comparing }
TypFunctionType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | type |
					type := anObject "typCastAs TypFunctionType".
					self nullable = type nullable and: [ self name = type name and: [ self parameters = type parameters and: [ self optionalParameters = type optionalParameters and: [ result = type result ] ] ] ] ] ]
]

{ #category : #comparing }
TypFunctionType >> > aType [
	^ self ~= aType
		and: [ aType isFunction
				ifTrue: [ | type |
					type := aType "typCastAs TypFunctionType".
					result >= type result
						and: [ | size |
							size := optionalParameters
								ifTrue: [ type parameters size ]
								ifFalse: [ parameters size ].
							size = 0
								or: [ size <= parameters size
										and: [ size <= type parameters size and: [ ((parameters copyFrom: 1 to: size) withIndexSelect: [ :e :i | e >= (type parameters at: i) ]) size = size ] ] ] ] ]
				ifFalse: [ super > aType ] ]
]

{ #category : #accessing }
TypFunctionType >> asTypeCompatibleWith: aType [
	| compatibleType compatibleResult |
	aType isFunction
		ifFalse: [ ^ TypUnknownType instance ].
	compatibleType := (self asParametricType: parameters) asTypeCompatibleWith: aType.
	compatibleType isParametric
		ifFalse: [ ^ compatibleType ].
	compatibleResult := result asTypeCompatibleWith: aType result.
	^ TypFunctionType new
		nullable: compatibleType nullable;
		name: compatibleType name;
		parameters: compatibleType parameters;
		result: compatibleResult;
		optionalParameters: (optionalParameters and: aType optionalParameters);
		yourself
]

{ #category : #comparing }
TypFunctionType >> hash [
	^ (super hash bitXor: optionalParameters hash) bitXor: result hash
]

{ #category : #accessing }
TypFunctionType >> initialize [
	<typTypeVariable: 'optionalParameters' as: 'Boolean'>
	<typTypeVariable: 'result' as: 'TypType'>
	super initialize.
	optionalParameters := false
]

{ #category : #testing }
TypFunctionType >> isFunction [
	^ true
]

{ #category : #accessing }
TypFunctionType >> optionalParameters [
	<typTypeResultAs: 'Boolean'>
	^ optionalParameters
]

{ #category : #accessing }
TypFunctionType >> optionalParameters: anObject [
	<typTypeArgument: 1 as: 'Boolean'>
	optionalParameters := anObject
]

{ #category : #copying }
TypFunctionType >> postCopy [
	super postCopy.
	result := result copy.
]

{ #category : #accessing }
TypFunctionType >> printOn: aStream [
	nullable
		ifTrue: [ aStream << '!' ].
	aStream << name asString.
	aStream
		<<
			(optionalParameters
				ifTrue: [ '[' ]
				ifFalse: [ '(' ]).
	1 to: parameters size do: [ :i | 
		(parameters at: i) printOn: aStream.
		i < parameters size
			ifTrue: [ aStream << ',' ] ].
	aStream
		<<
			(optionalParameters
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

{ #category : #'as yet unclassified' }
TypFunctionType >> superType [
	| superType |
	superType := super superType.
	superType isFunction
		ifTrue: [ superType := superType copy
				result: result copy;
				yourself ].
	^ superType
]
