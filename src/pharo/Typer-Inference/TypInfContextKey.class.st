Class {
	#name : #TypInfContextKey,
	#superclass : #Object,
	#instVars : [
		'node',
		'selfType',
		'superType'
	],
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Inference-Core'
}

{ #category : #initialization }
TypInfContextKey class >> initialize [

	index := WeakValueDictionary new
]

{ #category : #invalidation }
TypInfContextKey class >> invalidate [

	<script>
	index removeAll
]

{ #category : #'as yet unclassified' }
TypInfContextKey class >> node: aNode self: aType super: anotherType [

	^ index
		  at: { 
				  aNode identityHash.
				  aType.
				  anotherType }
		  ifAbsentPut: [ 
			  ^ self new
				    initializeNode: aNode self: aType super: anotherType;
				    yourself ]
]

{ #category : #comparing }
TypInfContextKey >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject node == node ifFalse: [ ^ false ].
	anObject self = selfType ifFalse: [ ^ false ].
	anObject super = superType ifFalse: [ ^ false ].
	^ true
]

{ #category : #comparing }
TypInfContextKey >> hash [

	^ (node identityHash bitXor: selfType hash) bitXor: superType hash
]

{ #category : #initialization }
TypInfContextKey >> initializeNode: aNode self: aType super: anotherType [

	node := aNode.
	selfType := aType.
	superType := anotherType
]

{ #category : #'as yet unclassified' }
TypInfContextKey >> node [

	^ node
]

{ #category : #'as yet unclassified' }
TypInfContextKey >> self [

	^ selfType
]

{ #category : #'as yet unclassified' }
TypInfContextKey >> super [

	^ superType
]
