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

	index := WeakValueDictionary new
]

{ #category : #invalidation }
TypInfAstNode class >> invalidate [

	<script>
	index removeAll
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
	^ anObject node = node
]

{ #category : #accessing }
TypInfAstNode >> asElementIn: aMondrian [

	| coder |
	(node methodNode isNotNil and: [ 
		 node methodNode compiledMethod isNotNil ])
		ifTrue: [ 
			coder := GtPharoMethodCoder forMethod:
				         node methodNode compiledMethod ]
		ifFalse: [ 
		coder := GtPharoSnippetCoder forSource: node formattedCode ].
	^ BlElement new
		  layout: BlLinearLayout vertical;
		  constraintsDo: [ :c | 
			  c horizontal fitContent.
			  c vertical fitContent ];
		  background: Color white;
		  addAptitude: BrGlamorousFocusableShadowAptitude;
		  addChild: (coder asCoderUIModel collapse asElement
				   hExact: 500;
				   yourself);
		  yourself
]

{ #category : #accessing }
TypInfAstNode >> hash [

	^ (self class hash bitXor: node hash) bitXor: context hash
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

	node printOn: aStream
]
