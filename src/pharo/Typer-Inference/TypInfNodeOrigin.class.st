Class {
	#name : #TypInfNodeOrigin,
	#superclass : #TypOrigin,
	#instVars : [
		'node'
	],
	#category : #'Typer-Inference'
}

{ #category : #accessing }
TypInfNodeOrigin class >> node: aNode [
	^ self new
		initializeNode: aNode;
		yourself
]

{ #category : #accessing }
TypInfNodeOrigin >> = anObject [
	super = anObject
		ifFalse: [ ^ false ].
	^ anObject node = node
]

{ #category : #accessing }
TypInfNodeOrigin >> hash [
	^ super hash bitXor: node hash
]

{ #category : #initialization }
TypInfNodeOrigin >> initializeNode: aNode [
	node := aNode
]

{ #category : #invalidation }
TypInfNodeOrigin >> invalidate [

	super invalidate.
	node withAllParents first typInfInvalidate
]

{ #category : #accessing }
TypInfNodeOrigin >> node [
	^ node
]

{ #category : #printing }
TypInfNodeOrigin >> printOn: aStream [
	node printOn: aStream
]
