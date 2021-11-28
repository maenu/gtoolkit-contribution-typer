Class {
	#name : #TypInfAstNode,
	#superclass : #TypNode,
	#instVars : [
		'node',
		'selfType'
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
TypInfAstNode class >> invalidate [

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
TypInfAstNode class >> node: aNode self: aType [

	^ index at: aNode -> aType ifAbsentPut: [ 
		  self new
			  initializeNode: aNode self: aType;
			  yourself ]
]

{ #category : #accessing }
TypInfAstNode >> = anObject [

	anObject == self ifTrue: [ ^ true ].
	anObject class = self class ifFalse: [ ^ false ].
	anObject node = node ifFalse: [ ^ false ].
	^ anObject selfType = selfType
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

	^ node hash bitXor: selfType hash
]

{ #category : #initialization }
TypInfAstNode >> initializeNode: aNode self: aType [

	node := aNode.
	selfType := aType
]

{ #category : #invalidation }
TypInfAstNode >> invalidate [

	node withAllParents first typInfInvalidateSelf: selfType
]

{ #category : #accessing }
TypInfAstNode >> node [
	^ node
]

{ #category : #printing }
TypInfAstNode >> printOn: aStream [
	node printOn: aStream
]

{ #category : #accessing }
TypInfAstNode >> selfType [

	^ selfType
]
