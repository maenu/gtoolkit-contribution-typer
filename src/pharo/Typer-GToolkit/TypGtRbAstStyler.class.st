Class {
	#name : #TypGtRbAstStyler,
	#superclass : #GtGenericPharoStyler,
	#traits : 'TRBProgramNodeVisitor',
	#classTraits : 'TRBProgramNodeVisitor classTrait',
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtRbAstStyler >> attributes: anAttributesCollection from: aStart to: anEnd [
	^ super
		attributes: anAttributesCollection
		from: aStart - self offset
		to: anEnd - self offset
]

{ #category : #styling }
TypGtRbAstStyler >> context [
	^ self coderViewModel coderModel typGtContext
]

{ #category : #accessing }
TypGtRbAstStyler >> offset [
	| node |
	node := self context node.
	node isBlock ifFalse: [ ^ 0 ].
	^ node body start - 1
]

{ #category : #styling }
TypGtRbAstStyler >> style: aText ast: anAst [
	self context ifNil: [ ^ self ].
	text := aText.
	[ self visitNode: self context node ]
		on: Error
		do: [ :e | (GtStylerErrorSignal new signaledError: e) emit ].
	text := nil
]

{ #category : #visiting }
TypGtRbAstStyler >> styleNode: aNode [
	self
		attributes: {TypGtTypeAttribute nodes: (self context nodesAt: aNode)}
		from: aNode stopWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #visiting }
TypGtRbAstStyler >> visitPragmaNode: aPragmaNode [

	"noop"

	
]
