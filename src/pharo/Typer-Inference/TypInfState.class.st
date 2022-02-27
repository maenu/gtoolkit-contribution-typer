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

{ #category : #'as yet unclassified' }
TypInfState class >> self: aType super: anotherType [

	^ self new
		  initializeSelf: aType super: anotherType;
		  yourself
]

{ #category : #comparing }
TypInfState >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class == self class ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ anObject index = index
]

{ #category : #accessing }
TypInfState >> at: aNode [

	^ index at: aNode
]

{ #category : #accessing }
TypInfState >> at: aNode put: aType [

	^ index at: aNode put: aType
]

{ #category : #accessing }
TypInfState >> diff: aState [

	| diff |
	diff := IdentityDictionary new.
	index keysAndValuesDo: [ :n :t | 
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

{ #category : #initialization }
TypInfState >> initializeSelf: aType super: anotherType [

	selfType := aType.
	superType := anotherType.
	index := IdentityDictionary new
]

{ #category : #splitjoin }
TypInfState >> join: aState [

	| result |
	self assert: [ aState self = selfType ].
	self assert: [ aState super = superType ].
	self assert: [ aState index keys = index keys ].
	result := self copy.
	index keysAndValuesDo: [ :n :t | 
		result at: n put: (self join: t with: (aState at: n)) ].
	^ result
]

{ #category : #accessing }
TypInfState >> join: aType with: anotherType [

	aType isUnknown ifTrue: [ ^ anotherType ].
	anotherType isUnknown ifTrue: [ ^ aType ].
	aType < anotherType ifTrue: [ ^ aType ].
	anotherType < aType ifTrue: [ ^ anotherType ].
	^ { 
		  aType.
		  anotherType } typAsType
]

{ #category : #copying }
TypInfState >> postCopy [

	super postCopy.
	index := index copy
]

{ #category : #'as yet unclassified' }
TypInfState >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfState >> super [

	^ superType
]
