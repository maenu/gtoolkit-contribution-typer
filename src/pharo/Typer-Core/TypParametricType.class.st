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
	^ (aType isParametric and: [ name = aType name ])
		ifTrue: [ self assert: [ bindings keys = aType bindings keys ].
			(bindings keys
				allSatisfy: [ :e | (bindings at: e) >= (aType bindings at: e) ])
				and: [ bindings keys
						anySatisfy: [ :e | (bindings at: e) > (aType bindings at: e) ] ] ]
		ifFalse: [ super > aType ]
]

{ #category : #converting }
TypParametricType >> asParametricType: someTypes [
	| type |
	self assert: [ someTypes keys = bindings keys ].
	type := self copy.
	someTypes keysAndValuesDo: [ :n :t | type bindings at: n put: t ].
	^ type
]

{ #category : #accessing }
TypParametricType >> asTypeCompatibleWith: aType [
	^ (aType isParametric and: [ name = aType name ])
		ifTrue: [ self assert: [ bindings keys = aType bindings keys ].
			self copy
				bindings:
					(bindings associations
						collect:
							[ :e | e key -> (e value asTypeCompatibleWith: (aType bindings at: e key)) ])
						asOrderedDictionary ]
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
		ifTrue: [ superType := superType copy.
			bindings
				keysAndValuesDo: [ :s :t | 
					(superType bindings includesKey: s)
						ifTrue: [ superType bindings at: s put: t ] ] ].
	^ superType
]
