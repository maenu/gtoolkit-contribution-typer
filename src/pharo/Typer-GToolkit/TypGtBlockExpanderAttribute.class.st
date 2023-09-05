Class {
	#name : #TypGtBlockExpanderAttribute,
	#superclass : #BrGlamorousTriangleExpanderTextAttribute,
	#instVars : [
		'context'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtBlockExpanderAttribute class >> inContext: aContext [
	^ self new
		initializeContext: aContext;
		yourself
]

{ #category : #accessing }
TypGtBlockExpanderAttribute >> buildBlockCoder [
	| coder |
	coder := GtPharoSnippetCoder new
			forSource: context node body sourceCode;
			yourself.
	coder attributeNamed: #typGtContext put: context.
	^ coder
]

{ #category : #accessing }
TypGtBlockExpanderAttribute >> initialize [
	super initialize.
	self
		attributesCreatingBlock: [ BrTextAdornmentDynamicAttribute new
				beAppend;
				stencil: [ self buildBlockCoder ] ]
]

{ #category : #accessing }
TypGtBlockExpanderAttribute >> initializeContext: aContext [
	context := aContext
]
