Class {
	#name : #TypInfState,
	#superclass : #IdentityDictionary,
	#instVars : [
		'selfType',
		'superType'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #'as yet unclassified' }
TypInfState class >> self: aType super: anotherType [

	^ self new
		  initializeSelf: aType super: anotherType;
		  yourself
]

{ #category : #comparing }
TypInfState >> = anObject [

	super = anObject ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ true
]

{ #category : #accessing }
TypInfState >> diff: aState [

	| diff |
	diff := IdentityDictionary new.
	self keysAndValuesDo: [ :n :t | 
		| r |
		r := aState at: n.
		r = t ifFalse: [ 
			diff at: n put: { 
					t.
					r } ] ].
	^ diff
]

{ #category : #comparing }
TypInfState >> hash [

	^ (super hash bitXor: selfType hash) bitXor: superType hash
]

{ #category : #initialization }
TypInfState >> initializeSelf: aType super: anotherType [

	selfType := aType.
	superType := anotherType
]

{ #category : #splitjoin }
TypInfState >> join: aState [

	| copy |
	self assert: [ aState self = selfType ].
	self assert: [ aState super = superType ].
	copy := self copy.
	aState keysAndValuesDo: [ :n :t | 
		copy
			at: n
			put:
			(copy at: n ifPresent: [ :tt | t tighten: tt ] ifAbsent: [ t ]) ].
	^ copy
]

{ #category : #'as yet unclassified' }
TypInfState >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfState >> super [

	^ superType
]
