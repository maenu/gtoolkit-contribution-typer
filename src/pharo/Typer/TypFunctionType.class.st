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
				and: [ | object |
					object := anObject "typCastAs TypFunctionType".
					nullable = object nullable
						and: [ type = object type
								and: [ parameters asOrderedCollection
										= object parameters asOrderedCollection
										and: [ result = object result ] ] ] ] ]
]

{ #category : #testing }
TypFunctionType >> asFunctionType: someTypes result: aType optionalParameters: aBoolean [
	| copy parameters_ |
	copy := self copy.
	parameters_ := OrderedCollection ofSize: (parameters size max: someTypes size).	"typParameters TypType"
	parameters withIndexDo: [ :e :i | parameters_ at: i put: e ].
	someTypes withIndexDo: [ :e :i | parameters_ at: i put: e ].
	copy parameters: parameters_.
	copy result: aType.
	copy optionalParameters: aBoolean.
	^ copy
]

{ #category : #accessing }
TypFunctionType >> asSourceString [
	| parameters_ |
	parameters_ := ',' join: (parameters collect: #asSourceString).
	optionalParameters
		ifTrue: [ parameters_ := '[' , parameters_ , ']' ]
		ifFalse: [ parameters_ := '(' , parameters_ , ')' ].
	^ super asSourceString , type asSourceString , parameters_ , '->' , result asSourceString
]

{ #category : #testing }
TypFunctionType >> canBeFunctionType [
	^ true
]

{ #category : #testing }
TypFunctionType >> hasSuperType [
	^ result isUnion or: [ (parameters anySatisfy: [ :e | e isUnion ]) or: [ type hasSuperType ] ]
]

{ #category : #comparing }
TypFunctionType >> hash [
	^ super hash bitXor: result hash
]

{ #category : #accessing }
TypFunctionType >> initialize [
	super initialize.
	optionalParameters := false
]

{ #category : #comparing }
TypFunctionType >> isCompatibleWith: aType [
	^ aType isFunction
		ifTrue: [ type >= aType type
				and: [ result >= aType result
						and: [ | size |
							size := optionalParameters
								ifTrue: [ aType parameters size ]
								ifFalse: [ parameters size ].
							size = 0
								or:
									[ size <= parameters size and: [ ((parameters copyFrom: 1 to: size) withIndexSelect: [ :e :i | e >= (aType parameters at: i) ]) size = size ] ] ] ] ]
		ifFalse: [ super isCompatibleWith: aType ]
]

{ #category : #testing }
TypFunctionType >> isFunction [
	^ true
]

{ #category : #accessing }
TypFunctionType >> optionalParameters [
	^ optionalParameters
]

{ #category : #accessing }
TypFunctionType >> optionalParameters: anObject [
	optionalParameters := anObject
]

{ #category : #accessing }
TypFunctionType >> printOn: aStream [
	type printOn: aStream.
	aStream
		<<
			(optionalParameters
				ifTrue: [ '[' ]
				ifFalse: [ '(' ]).
	aStream << (',' join: (parameters collect: #printString)).
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
	^ result
]

{ #category : #accessing }
TypFunctionType >> result: anObject [
	result := anObject
]

{ #category : #accessing }
TypFunctionType >> superType [
	self assert: [ self hasSuperType ].
	^ result isUnion
		ifTrue: [ self copy
				result: result superType;
				yourself ]
		ifFalse: [ (parameters anySatisfy: [ :e | e isUnion ])
				ifTrue: [ self copy
						parameters:
							(parameters
								collect: [ :e | 
									e isUnion
										ifTrue: [ e superType ]
										ifFalse: [ e ] ]);
						yourself ]
				ifFalse: [ | superType |
					superType := type superType.
					superType isParametric
						ifTrue: [ self copy
								type: superType asNonParametricType;
								yourself ]
						ifFalse: [ superType ] ] ]
]
