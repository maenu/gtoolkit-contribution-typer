Class {
	#name : #TypInfAstNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'context'
	],
	#classInstVars : [
		'index'
	],
	#category : #'Typer-Inference'
}

{ #category : #initialization }
TypInfAstNode class >> initialize [

	<script>
	index := WeakIdentityKeyDictionary new
]

{ #category : #invalidation }
TypInfAstNode class >> invalidate [

	<script>
	self initialize
]

{ #category : #accessing }
TypInfAstNode class >> node: aNode [

	^ index at: aNode ifAbsentPut: [ 
		  self new
			  initializeNode: aNode;
			  yourself ]
]

{ #category : #accessing }
TypInfAstNode >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	^ anObject node == node
]

{ #category : #accessing }
TypInfAstNode >> asElementIn: aMondrian [

	^ BlElement new
		  layout: BlLinearLayout vertical;
		  constraintsDo: [ :c | 
			  c horizontal fitContent.
			  c vertical fitContent ];
		  background: Color white;
		  addAptitude: BrGlamorousFocusableShadowAptitude;
		  addChild:
			  ((GtPharoSnippetCoder forSource: node formattedCode)
				   asCoderUIModel collapse asElement
				   hExact: 350;
				   yourself);
		  yourself
]

{ #category : #accessing }
TypInfAstNode >> hash [

	^ (self class hash bitXor: node identityHash) bitXor: context hash
]

{ #category : #initialization }
TypInfAstNode >> initializeNode: aNode [

	node := aNode
]

{ #category : #accessing }
TypInfAstNode >> node [
	^ node
]

{ #category : #printing }
TypInfAstNode >> printOn: aStream [

	aStream nextPutAll: (node printStringLimitedTo: 32)
]
