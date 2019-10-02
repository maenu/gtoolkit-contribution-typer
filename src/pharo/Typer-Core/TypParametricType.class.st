Class {
	#name : #TypParametricType,
	#superclass : #TypNamedType,
	#instVars : [
		'bindings'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #comparing }
TypParametricType >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ | object |
					object := anObject "typCastAs TypParametricType".
					name = object name and: [ bindings = object bindings ] ] ]
]

{ #category : #comparing }
TypParametricType >> > aType [
	^ aType isParametric
		and: [ | typeDifferent |
			typeDifferent := (self = aType) not.
			super >= aType
				and: [ | type_ |
					type_ := aType.	"typCastAs TypParametricType"
					(type_ bindings keys includesAll: bindings keys)
						and: [ | bindingsDifferent |
							bindingsDifferent := bindings keys
								inject: false
								into: [ :r :e | 
									| a b |
									a := bindings at: e.
									b := type_ bindings at: e.
									a >= b
										ifFalse: [ ^ false ].
									r or: [ (a = b) not ] ].
							typeDifferent or: bindingsDifferent ] ] ]
]

{ #category : #accessing }
TypParametricType >> asTypeCompatibleWith: aType [
	"Assume parameters map with parameters of super type."
self flag: 'TODO rewrite with new scope logic'.
	^ aType isParametric
		ifTrue: [ | type_ minSize parameters_ |
			type_ := aType "typCastAs TypGenericType".
			minSize := parameters size min: type_ parameters size.
			parameters_ := (minSize
				timesCollect: [ :i | 
					(parameters at: i)
						asTypeCompatibleWith: (type_ parameters at: i) ])
				,
					(type_ parameters
						copyFrom: minSize + 1
						to: type_ parameters size).
			type_ copy
				parameters: parameters_;
				yourself ]
		ifFalse: [ super asTypeCompatibleWith: aType ]
]

{ #category : #accessing }
TypParametricType >> bindings [
	^ bindings
]

{ #category : #accessing }
TypParametricType >> bindings: anObject [
	bindings := anObject
]

{ #category : #comparing }
TypParametricType >> hash [
	^ super hash bitXor: bindings hash
]

{ #category : #initialization }
TypParametricType >> initialize [
	super initialize.
	bindings := OrderedDictionary new
]

{ #category : #testing }
TypParametricType >> isParametric [
	^ true
]

{ #category : #copying }
TypParametricType >> postCopy [
	super postCopy.
	bindings := bindings collect: #copy
]

{ #category : #printing }
TypParametricType >> printOn: aStream [
	super printOn: aStream.
	aStream << '<'.
	1 to: bindings size do: [ :i | 
		(bindings at: (bindings keys at: i)) printOn: aStream.
		i < bindings size
			ifTrue: [ aStream << ',' ] ].
	aStream << '>'
]

{ #category : #accessing }
TypParametricType >> superType [
	superType := super superType.
	superType isParametric
		ifTrue: [ bindings
				keysAndValuesDo: [ :s :t | 
					(superType bindings includesKey: s)
						ifTrue: [ superType at: s put: t ] ] ].
	^ superType
]
