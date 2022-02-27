Class {
	#name : #TypInfMethodNodeLookup,
	#superclass : #Object,
	#instVars : [
		'node',
		'selfType',
		'superType'
	],
	#category : #'Typer-Inference'
}

{ #category : #'as yet unclassified' }
TypInfMethodNodeLookup class >> node: aNode self: aType super: anotherType [

	^ self new
		  initializeNode: aNode self: aType super: anotherType;
		  yourself
]

{ #category : #comparing }
TypInfMethodNodeLookup >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject node == node ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
TypInfMethodNodeLookup >> hash [

	^ (node identityHash bitXor: selfType hash) bitXor: superType hash
]

{ #category : #initialization }
TypInfMethodNodeLookup >> initializeNode: aNode self: aType super: anotherType [

	node := aNode.
	selfType := aType.
	superType := anotherType
]

{ #category : #'as yet unclassified' }
TypInfMethodNodeLookup >> node [

	^ node
]

{ #category : #'as yet unclassified' }
TypInfMethodNodeLookup >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfMethodNodeLookup >> super [

	^ superType
]
