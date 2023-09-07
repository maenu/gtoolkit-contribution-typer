Class {
	#name : #TypInfState,
	#superclass : #OrderedIdentityDictionary,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState >> at: aNode covariantPut: aType [
	^ self
		at: aNode
		put: (self
				at: aNode
				ifPresent: [ :t | t covariant: aType ]
				ifAbsent: [ aType ])
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [
	self assert: [ aType isKindOf: TypType ].
	^ super at: aNode put: aType
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
	diff := OrderedIdentityDictionary new.
	self keys , aState keys do: [ :n | 
		| a b |
		a := self at: n ifAbsent: [ nil ].
		b := aState at: n ifAbsent: [ nil ].
		a = b ifFalse: [ 
			diff at: n put: { 
					a.
					b } ] ].
	^ diff
]
