Class {
	#name : #TypInfAstNode,
	#superclass : #TypNode,
	#instVars : [
		'node'
	],
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Inference'
}

{ #category : #initialization }
TypInfAstNode class >> initialize [

	index := WeakKeyDictionary new
]

{ #category : #accessing }
TypInfAstNode class >> node: aNode [

	^ index at: aNode ifAbsentPut: [ 
		  self new
			  initializeNode: aNode;
			  yourself ]
]

{ #category : #initialization }
TypInfAstNode >> initializeNode: aNode [
	node := aNode
]

{ #category : #invalidation }
TypInfAstNode >> invalidate [

	node withAllParents first typInfInvalidate
]

{ #category : #accessing }
TypInfAstNode >> node [
	^ node
]

{ #category : #printing }
TypInfAstNode >> printOn: aStream [
	node printOn: aStream
]
