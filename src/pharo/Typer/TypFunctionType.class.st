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
				and: [ nullable = anObject nullable
						and:
							[ type = anObject type and: [ parameters asOrderedCollection = anObject parameters asOrderedCollection and: [ result = anObject result ] ] ] ] ]
]

{ #category : #testing }
TypFunctionType >> asFunctionType: someTypes result: aType [
	| copy parameters_ |
	copy := self copy.
	parameters_ := OrderedCollection ofSize: (parameters size max: someTypes size).	"typParameters TypType"
	parameters withIndexDo: [ :e :i | parameters_ at: i put: e ].
	someTypes withIndexDo: [ :e :i | parameters_ at: i put: e ].
	copy parameters: parameters_.
	copy result: aType.
	^ copy
]

{ #category : #accessing }
TypFunctionType >> asSourceString [
	| parameters_ |
	parameters_ := '<' , (',' join: (parameters collect: #asSourceString)) , '>'.
	optionalParameters
		ifTrue: [ parameters_ := '[' , parameters_ , ']' ].
	^ super asSourceString , type asSourceString , parameters_ , '->' , result asSourceString
]

{ #category : #testing }
TypFunctionType >> canBeFunctionType [
	^ true
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
	optionalParameters
		ifTrue: [ aStream << '[' ].
	aStream << '<'.
	aStream << (',' join: (parameters collect: #printString)).
	aStream << '>'.
	optionalParameters
		ifTrue: [ aStream << ']' ].
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
	^ (parameters anySatisfy: [ :e | e isUnion ])
		ifTrue: [ self copy
				parameters:
					(parameters
						collect: [ :e | 
							e isUnion
								ifTrue: [ e superType ]
								ifFalse: [ e ] ]);
				yourself ]
		ifFalse: [ result isUnion
				ifTrue: [ self copy
						result: result superType;
						yourself ]
				ifFalse: [ optionalParameters
						ifTrue: [ self copy
								parameters:
									(parameters size > 1
										ifTrue: [ parameters copyFrom: 1 to: parameters size - 1 ]
										ifFalse: [ {} ]);
								yourself ]
						ifFalse: [ | superType |
							superType := type superType.
							superType isParametric
								ifTrue: [ self copy
										type: superType asNonParametricType;
										yourself ]
								ifFalse: [ superType ] ] ] ]
]
