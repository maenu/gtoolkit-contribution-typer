Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'index',
		'selfType',
		'superType',
		'changed'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #accessing }
TypInfState class >> invalidate [

	self allInstancesDo: #initialize
]

{ #category : #'as yet unclassified' }
TypInfState class >> self: aType super: anotherType [

	^ self self: aType super: anotherType index: IdentityDictionary new
]

{ #category : #'as yet unclassified' }
TypInfState class >> self: aType super: anotherType index: aDictionary [

	^ self new
		  initializeSelf: aType super: anotherType index: aDictionary;
		  yourself
]

{ #category : #comparing }
TypInfState >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	(anObject isKindOf: TypInfState) ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ anObject index = self index
]

{ #category : #accessing }
TypInfState >> at: aNode [

	^ index at: aNode
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [

	^ index
		  at: aNode
		  ifPresent: [ :e | 
			  e == aType
				  ifTrue: [ aType ]
				  ifFalse: [ 
					  changed := true.
					  index at: aNode put: aType ] ]
		  ifAbsentPut: [ 
			  changed := true.
			  aType ]
]

{ #category : #accessing }
TypInfState >> changed [

	^ changed
]

{ #category : #copying }
TypInfState >> copy [

	"don't really copy, just wrap it"

	^ super copy "TypInfWrappingState state: self"
]

{ #category : #accessing }
TypInfState >> diff: aState [

	| diff |
	diff := IdentityDictionary new.
	self index keysAndValuesDo: [ :n :t | 
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

	^ (index hash bitXor: selfType hash) bitXor: superType hash
]

{ #category : #accessing }
TypInfState >> index [

	^ index
]

{ #category : #initialization }
TypInfState >> initializeSelf: aType super: anotherType index: aDictionary [

	changed := false.
	selfType := aType.
	superType := anotherType.
	index := aDictionary
]

{ #category : #accessing }
TypInfState >> invalidate [

	index removeAll
]

{ #category : #splitjoin }
TypInfState >> join: aState [

	| copy |
	self assert: [ aState self = selfType ].
	self assert: [ aState super = superType ].
	copy := self copy.
	aState index keysAndValuesDo: [ :n :t | 
		copy at: n put: (copy index
				 at: n
				 ifPresent: [ :tt | t asNarrower: tt ]
				 ifAbsent: [ t ]) ].
	^ copy
]

{ #category : #copying }
TypInfState >> postCopy [

	super postCopy.
	changed := false.
	index := index copy
]

{ #category : #'as yet unclassified' }
TypInfState >> self [

	^ selfType
]

{ #category : #accessing }
TypInfState >> size [

	^ self index size
]

{ #category : #'as yet unclassified' }
TypInfState >> super [

	^ superType
]
