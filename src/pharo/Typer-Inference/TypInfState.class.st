Class {
	#name : #TypInfState,
	#superclass : #Object,
	#instVars : [
		'index',
		'selfType',
		'superType'
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

	^ index at: aNode put: aType
]

{ #category : #copying }
TypInfState >> copy [

	"don't really copy, just wrap it"

	^ TypInfWrappingState state: self
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

{ #category : #accessing }
TypInfState >> gtItemsFor: aView [

	<gtView>
	^ aView forward
		  title: 'Index';
		  priority: 10;
		  object: [ index ];
		  view: #gtItemsFor:
]

{ #category : #comparing }
TypInfState >> hash [

	^ (index hash bitXor: selfType hash) bitXor: superType hash
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

{ #category : #initialization }
TypInfState >> initializeSelf: aType super: anotherType index: aDictionary [

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
				 ifPresent: [ :tt | self join: t with: tt ]
				 ifAbsent: [ t ]) ].
	^ copy
]

{ #category : #accessing }
TypInfState >> join: aType with: anotherType [

	aType > anotherType ifTrue: [ ^ anotherType ].
	anotherType > aType ifTrue: [ ^ aType ].
	^ aType with: anotherType
]

{ #category : #'as yet unclassified' }
TypInfState >> self [

	^ selfType
]

{ #category : #accessing }
TypInfState >> size [

	^ index size
]

{ #category : #'as yet unclassified' }
TypInfState >> super [

	^ superType
]
