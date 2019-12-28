Class {
	#name : #TypTypeVariableScope,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #generated }
TypTypeVariableScope class >> variables: aSet [
	<typTypeArgument: 1 as: 'Set<TypTypeVariableType>'>
	| instance |
	instance := self new.
	aSet do: [ :e | instance at: e put: e ].
	^ instance
]

{ #category : #comparing }
TypTypeVariableScope >> < anObject [
	^ anObject > self
]

{ #category : #comparing }
TypTypeVariableScope >> <= anObject [
	^ anObject >= self
]

{ #category : #comparing }
TypTypeVariableScope >> = anObject [
	^ self == anObject
		or: [ self class = anObject class
				and: [ self variables = anObject variables
						and:
							[ self variables allSatisfy: [ :e | (self at: e) = (anObject at: e) ] ] ] ]
]

{ #category : #comparing }
TypTypeVariableScope >> > anObject [
	^ self ~= anObject
		and: [ self variables = anObject variables
				and: [ self variables
						allSatisfy: [ :e | 
							| a b |
							a := self at: e.
							b := anObject at: e.
							a isTypeVariable
								ifTrue: [ true ]
								ifFalse: [ a >= b ] ] ] ]
]

{ #category : #comparing }
TypTypeVariableScope >> >= anObject [
	^ self = anObject or: [ self > anObject ]
]

{ #category : #enumerating }
TypTypeVariableScope >> addAll: aBindings [
	<typTypeArgument: 1 as: 'TypTypeVariableBindings'>
	aBindings variables do: [ :e | self at: e put: (aBindings at: e) ]
]

{ #category : #converting }
TypTypeVariableScope >> asCompatibleWith: aBindings [
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
TypTypeVariableScope >> at: aTypeVariable [
	<typTypeArgument: 1 as: 'TypTypeVariableType'>
	| current discovered |
	current := aTypeVariable.
	discovered := OrderedCollection new "typParameters TypType".
	[ current isTypeVariable and: [ (discovered includes: current) not ] ]
		whileTrue: [ discovered add: current.
			current := bindings at: current ].
	^ current
]

{ #category : #accessing }
TypTypeVariableScope >> at: aTypeVariable put: aType [
	<typTypeArgument: 1 as: 'TypTypeVariableType'>
	<typTypeArgument: 2 as: 'TypType'>
	self assert: [ aTypeVariable isTypeVariable ].
	^ bindings at: aTypeVariable put: aType
]

{ #category : #copying }
TypTypeVariableScope >> copyWithout: aTypeVariable [
	^ self copy
		remove: aTypeVariable;
		yourself
]

{ #category : #comparing }
TypTypeVariableScope >> hash [
	^ bindings hash
]

{ #category : #removing }
TypTypeVariableScope >> includes: aTypeVariable [
	^ bindings includesKey: aTypeVariable
]

{ #category : #initialization }
TypTypeVariableScope >> initialize [
	<typTypeVariable: #bindings as: 'Dictionary<TypTypeVariableType,TypType>'>
	super initialize.
	bindings := Dictionary new "typParameters TypTypeVariableType,TypType"
]

{ #category : #testing }
TypTypeVariableScope >> isEmpty [
	^ bindings isEmpty
]

{ #category : #testing }
TypTypeVariableScope >> isNotEmpty [
	^ bindings isNotEmpty
]

{ #category : #copying }
TypTypeVariableScope >> postCopy [
	super postCopy.
	bindings := bindings collect: #copy
]

{ #category : #removing }
TypTypeVariableScope >> remove: aTypeVariable [
	<typTypeArgument: 1 as: 'TypTypeVariableType'>
	self
		assert: [ bindings values allSatisfy: [ :e | e ~= aTypeVariable ] ].
	bindings removeKey: aTypeVariable
]

{ #category : #accessing }
TypTypeVariableScope >> size [
	^ bindings size
]

{ #category : #accessing }
TypTypeVariableScope >> variables [
	^ bindings keys asSet
]
