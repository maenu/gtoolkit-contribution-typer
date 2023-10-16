Class {
	#name : #TypGtRbAstStyler,
	#superclass : #GtGenericPharoStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#instVars : [
		'context'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtRbAstStyler >> attributes: anAttributesCollection from: aStart to: anEnd [
	^ super
		attributes: anAttributesCollection
		from: aStart - self offset
		to: anEnd - self offset
]

{ #category : #accessing }
TypGtRbAstStyler >> offset [
	| node |
	node := context node.
	node isBlock ifFalse: [ ^ 0 ].
	^ node body start - 1
]

{ #category : #styling }
TypGtRbAstStyler >> style: aText ast: anAst [
	| coder |
	coder := self coderViewModel coderModel.
	coder typGtHasContext ifFalse: [ ^ self ].
	text := aText.
	[ context := coder typGtContext.
	self visitNode: context node ]
		on: Error
		do: [ :e | (GtStylerErrorSignal new signaledError: e) emit ].
	text := nil.
	context := nil
]

{ #category : #visiting }
TypGtRbAstStyler >> styleNode: aNode [
	self
		attributes: {TypGtTypeAttribute nodes: (context nodesAt: aNode)}
		from: aNode stopWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #visiting }
TypGtRbAstStyler >> visitPragmaNode: aPragmaNode [

	"noop"

	
]
