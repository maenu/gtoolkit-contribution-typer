Class {
	#name : #TypInfState,
	#superclass : #IdentityDictionary,
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState >> at: anObject [
	^ self at: anObject ifAbsent: TypUnknownType instance
]

{ #category : #splitjoin }
TypInfState >> covariant: aState [

	| copy |
	self flag: 'self assert: [ aState self = selfType ].
	self assert: [ aState super = superType ]'.
	copy := aState copy.
	aState keysAndValuesDo: [ :n :t | 
		copy
			at: n
			put:
			(self at: n ifPresent: [ :tt | t covariant: tt ] ifAbsent: [ t ]) ].
	^ copy
]

{ #category : #accessing }
TypInfState >> diff: aState [

	| diff |
	diff := TypInfState new.
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
