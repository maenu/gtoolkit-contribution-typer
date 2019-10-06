Class {
	#name : #TypTypeVariableBindings,
	#superclass : #Object,
	#instVars : [
		'bindings'
	],
	#category : #'Typer-Core-Type'
}

{ #category : #generated }
TypTypeVariableBindings class >> parameters: aSet [
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
	^ self variables = anObject variables
		and: [ self variables
				allSatisfy: [ :e | 
					| a b |
					a := self at: e.
					b := anObject at: e.
					a isTypeVariable
						ifTrue: [ true ]
						ifFalse: [ a = b ] ] ]
]

{ #category : #comparing }
TypTypeVariableBindings >> >= anObject [
	^ self = anObject or: [ self > anObject ]
]

{ #category : #converting }
TypTypeVariableBindings >> asCompatibleWith: aBindings [
	| copy |
	self assert: [ aBindings variables includesAll: self variables ].
	copy := self copy.
	copy variables
		do: [ :e | 
			(copy at: e) = (aBindings at: e)
				ifFalse: [ copy at: e put: e ] ].
	^ copy
]

{ #category : #accessing }
TypTypeVariableBindings >> at: aTypeVariable [
	^ bindings at: aTypeVariable
]

{ #category : #accessing }
TypTypeVariableBindings >> at: aTypeVariable put: aType [
	self
		assert: [ aTypeVariable isTypeVariable
				and: [ (aType isTypeVariable and: [ aTypeVariable = aType ])
						or: [ aType isTypeVariable not and: [ aType isType ] ] ] ].
	^ bindings at: aTypeVariable put: aType
]

{ #category : #comparing }
TypTypeVariableBindings >> hash [
	^ bindings hash
]

{ #category : #initialization }
TypTypeVariableBindings >> initialize [
	super initialize.
	bindings := Dictionary new
]

{ #category : #testing }
TypTypeVariableBindings >> isEmpty [
	^ bindings isEmpty
]

{ #category : #testing }
TypTypeVariableBindings >> isNotEmpty [
	^ bindings isNotEmpty
]

{ #category : #enumerating }
TypTypeVariableBindings >> keysAndValuesDo: aBlock [
	^ bindings keysAndValuesDo: aBlock
]

{ #category : #copying }
TypTypeVariableBindings >> postCopy [
	super postCopy.
	bindings := bindings collect: #copy
]

{ #category : #accessing }
TypTypeVariableBindings >> size [
	^ bindings size
]

{ #category : #accessing }
TypTypeVariableBindings >> variables [ 
	^ bindings keys
]
