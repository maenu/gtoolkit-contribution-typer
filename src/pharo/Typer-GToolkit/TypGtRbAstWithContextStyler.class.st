Class {
	#name : #TypGtRbAstWithContextStyler,
	#superclass : #TypGtRbAstStyler,
	#instVars : [
		'context'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtRbAstWithContextStyler >> attributes: anAttributesCollection from: aStart to: anEnd [
	^ super
		attributes: anAttributesCollection
		from: aStart - self offset
		to: anEnd - self offset
]

{ #category : #accessing }
TypGtRbAstWithContextStyler >> offset [
	| node |
	node := context node.
	node isBlock ifFalse: [ ^ 0 ].
	^ node body start - 1
]

{ #category : #styling }
TypGtRbAstWithContextStyler >> style: aText ast: anAst [
	| coder |
	coder := self coderViewModel coderModel.
	coder typGtHasContext ifFalse: [ ^ self	"style requested later" ].
	text := aText.
	[ context := coder typGtContext.
	self visitNode: context node ]
		on: Error
		do: [ :e | (GtStylerErrorSignal new signaledError: e) emit ].
	text := nil	"context := nil"
]

{ #category : #visiting }
TypGtRbAstWithContextStyler >> styleNode: aNode [
	self
		attributes: {TypGtTypeAttribute nodes: (context nodesAt: aNode)}
		from: aNode stopWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #visiting }
TypGtRbAstWithContextStyler >> visitPragmaNode: aPragmaNode [

	"noop"

	
]
