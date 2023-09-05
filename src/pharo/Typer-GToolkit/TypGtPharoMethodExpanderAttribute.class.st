Class {
	#name : #TypGtPharoMethodExpanderAttribute,
	#superclass : #GtPharoMethodExpanderAttribute,
	#instVars : [
		'context'
	],
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtPharoMethodExpanderAttribute class >> forClass: aClass andSelector: aSymbol inContext: aContext [
	^ (self forClass: aClass andSelector: aSymbol)
		initializeContext: aContext;
		yourself
]

{ #category : #accessing }
TypGtPharoMethodExpanderAttribute >> buildMethodCoder [
	| coder |
	coder := GtPharoMethodCoder forMethod: self compiledMethod.
	coder attributeNamed: #typGtContext put: context.
	^ coder asElement
		margin: (BlInsets
				top: 3
				right: 10
				bottom: 10
				left: 10);
		yourself
]

{ #category : #accessing }
TypGtPharoMethodExpanderAttribute >> initializeContext: aContext [
	context := aContext
]
