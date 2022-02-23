Class {
	#name : #TypInfFlowState,
	#superclass : #Object,
	#instVars : [
		'index',
		'selfType',
		'superType'
	],
	#category : #'Typer-Inference'
}

{ #category : #'as yet unclassified' }
TypInfFlowState class >> self: aType super: anotherType [

	^ self new
		  initializeSelf: aType super: anotherType;
		  yourself
]

{ #category : #comparing }
TypInfFlowState >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class == self class ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ anObject index = index
]

{ #category : #accessing }
TypInfFlowState >> at: aNode [

	^ index at: aNode
]

{ #category : #accessing }
TypInfFlowState >> at: aNode put: aType [

	^ index at: aNode put: aType
]

{ #category : #accessing }
TypInfFlowState >> gtItemsFor: aView [

	<gtView>
	^ aView forward
		  title: 'Index';
		  priority: 10;
		  object: [ index ];
		  view: #gtItemsFor:
]

{ #category : #comparing }
TypInfFlowState >> hash [

	^ (index hash bitXor: selfType hash) bitXor: superType hash
]

{ #category : #accessing }
TypInfFlowState >> index [

	^ index
]

{ #category : #initialization }
TypInfFlowState >> initializeSelf: aType super: anotherType [

	selfType := aType.
	superType := anotherType.
	index := IdentityDictionary new
]

{ #category : #splitjoin }
TypInfFlowState >> join: aState [

	| result |
	self assert: [ aState self = selfType ].
	self assert: [ aState super = superType ].
	self assert: [ aState index keys = index keys ].
	result := self copy.
	index keysDo: [ :n | 
		({ 
			 (index at: n).
			 (aState at: n) } copyWithout: TypUnknownType instance) 
			ifNotEmpty: [ :c | result at: n put: c typAsType ] ].
	^ result
]

{ #category : #copying }
TypInfFlowState >> postCopy [

	super postCopy.
	index := index copy
]

{ #category : #'as yet unclassified' }
TypInfFlowState >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfFlowState >> super [

	^ superType
]
