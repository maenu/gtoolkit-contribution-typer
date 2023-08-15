Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'index'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	self class = anObject class ifFalse: [ ^ false ].
	^ index = anObject index
]

{ #category : #accessing }
TypInfState >> at: anObject [
	^ self
		at: anObject
		ifAbsent: [ "Halt now."
			TypUnknownType instance ]
]

{ #category : #accessing }
TypInfState >> at: aNode covariantPut: aType [
	^ index
		at: aNode
		put: ((index at: aNode ifAbsent: TypUnknownType instance) covariant: aType)
]

{ #category : #accessing }
TypInfState >> at: aNode ifAbsent: aBlock [
	^ index at: aNode ifAbsent: aBlock
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [
	^ index at: aNode put: aType
]

{ #category : #splitjoin }
TypInfState >> covariant: aState [
	| copy |
	copy := self copy.
	aState keysAndValuesDo: [ :n :t | copy at: n covariantPut: t ].
	^ copy
]

{ #category : #accessing }
TypInfState >> diff: aState [

	| diff |
	diff := TypInfState new.
	index keys , aState keys do: [ :n | 
		| a b |
		a := self at: n ifAbsent: [ nil ].
		b := aState at: n ifAbsent: [ nil ].
		a = b ifFalse: [ 
			diff at: n put: { 
					a.
					b } ] ].
	^ diff
]

{ #category : #accessing }
TypInfState >> hash [
	^ index hash
]

{ #category : #accessing }
TypInfState >> ifNotEmpty: aBlock [
	^ self isEmpty ifTrue: [ self ] ifFalse: [ aBlock cull: self ]
]

{ #category : #accessing }
TypInfState >> index [
	^ index
]

{ #category : #accessing }
TypInfState >> initialize [
	super initialize.
	index := IdentityDictionary new
]

{ #category : #accessing }
TypInfState >> isEmpty [
	^ index isEmpty
]

{ #category : #accessing }
TypInfState >> keys [
	^ index keys
]

{ #category : #accessing }
TypInfState >> keysAndValuesDo: aBlock [
	^ index keysAndValuesDo: aBlock
]

{ #category : #accessing }
TypInfState >> postCopy [
	super postCopy.
	index := index copy
]

{ #category : #accessing }
TypInfState >> removeKey: anObject [
	^ index removeKey: anObject
]
