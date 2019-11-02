Class {
	#name : #TypTypeVariableBindings,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #generated }
TypTypeVariableBindings class >> variables: aSet [
	| instance |
	instance := self new.
	aSet do: [ :e | instance at: e put: e ].
	^ instance
]

{ #category : #comparing }
TypTypeVariableBindings >> < anObject [
	^ anObject > self
]

{ #category : #comparing }
TypTypeVariableBindings >> <= anObject [
	^ anObject >= self
]

{ #category : #comparing }
TypTypeVariableBindings >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ self variables = anObject variables
						and:
							[ self variables allSatisfy: [ :e | (self at: e) = (anObject at: e) ] ] ] ]
]

{ #category : #comparing }
TypTypeVariableBindings >> > anObject [
	^ self ~= anObject
		and: [ self variables = anObject variables
				and: [ self variables
						allSatisfy: [ :e | 
							| a b |
							a := self at: e.
							b := anObject at: e.
							a isTypeVariable
								ifTrue: [ true ]
								ifFalse: [ a = b ] ] ] ]
]

{ #category : #comparing }
TypTypeVariableBindings >> >= anObject [
	^ self = anObject or: [ self > anObject ]
]

{ #category : #enumerating }
TypTypeVariableBindings >> addAll: aBindings [
	aBindings variables do: [ :e | self at: e put: (aBindings at: e) ]
]

{ #category : #converting }
TypTypeVariableBindings >> asCompatibleWith: aBindings [
	| copy |
	self assert: [ aBindings variables = self variables ].
	copy := self copy.
	copy variables
		do: [ :e | 
			| a b |
			a := copy at: e.
			b := aBindings at: e.
			a = b
				ifFalse: [ self assert: [ (a isTypeVariable and: [ b isTypeVariable ]) not ].
					(a isTypeVariable not and: [ b isTypeVariable not ])
						ifTrue: [ copy at: e put: e ]
						ifFalse: [ copy at: e put: (a asCompatibleWith: b) ] ] ].
	^ copy
]

{ #category : #accessing }
TypTypeVariableBindings >> at: aTypeVariable [
	| current discovered |
	current := aTypeVariable.
	discovered := OrderedCollection new.
	[ current isTypeVariable and: [ (discovered includes: current) not ] ]
		whileTrue: [ discovered add: current.
			current := bindings at: current ].
	^ current
]

{ #category : #accessing }
TypTypeVariableBindings >> at: aTypeVariable put: aType [
	self
		assert: [ aTypeVariable isTypeVariable
				and: [ (aType isTypeVariable
						and: [ aTypeVariable = aType or: [ self variables includes: aType ] ])
						or: [ aType isTypeVariable not and: [ aType isType ] ] ] ].
	^ bindings at: aTypeVariable put: aType
]

{ #category : #copying }
TypTypeVariableBindings >> copyWithout: aTypeVariable [
	^ self copy
		remove: aTypeVariable;
		yourself
]

{ #category : #comparing }
TypTypeVariableBindings >> hash [
	^ bindings hash
]

{ #category : #removing }
TypTypeVariableBindings >> includes: aTypeVariable [
	^ bindings includesKey: aTypeVariable
]

{ #category : #initialization }
TypTypeVariableBindings >> initialize [
	<typTypeVariable: #bindings as: 'Dictionary<TypeVariable,TypType>'>
	super initialize.
	bindings := Dictionary new "typParameters TypeVariable,TypType"
]

{ #category : #testing }
TypTypeVariableBindings >> isEmpty [
	^ bindings isEmpty
]

{ #category : #testing }
TypTypeVariableBindings >> isNotEmpty [
	^ bindings isNotEmpty
]

{ #category : #copying }
TypTypeVariableBindings >> postCopy [
	super postCopy.
	bindings := bindings collect: #copy
]

{ #category : #removing }
TypTypeVariableBindings >> remove: aTypeVariable [
	self
		assert: [ bindings values allSatisfy: [ :e | e ~= aTypeVariable ] ].
	bindings removeKey: aTypeVariable
]

{ #category : #accessing }
TypTypeVariableBindings >> size [
	^ bindings size
]

{ #category : #accessing }
TypTypeVariableBindings >> variables [
	^ bindings keys asSet
]
