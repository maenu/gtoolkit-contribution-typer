Class {
	#name : #TypGtRbAstWithContextStyler,
	#superclass : #TypGtRbAstStyler,
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
	node := coderViewModel typGtContext node.
	node isBlock ifFalse: [ ^ 0 ].
	^ node body start - 1
]

{ #category : #styling }
TypGtRbAstWithContextStyler >> style: aText ast: anAst [
	coderViewModel coderModel typGtContextEnabled
		ifFalse: [ ^ self	"style may be requested later" ].
	text := aText.
	[ self visitNode: coderViewModel typGtContext node ]
		on: Error
		do: [ :e | (GtStylerErrorSignal new signaledError: e) emit ].
	text := nil
]

{ #category : #visiting }
TypGtRbAstWithContextStyler >> styleNode: aNode [
	self
		attributes: {TypGtTypeAttribute nodes: (coderViewModel typGtContext nodesAt: aNode)}
		from: aNode stopWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #visiting }
TypGtRbAstWithContextStyler >> visitPragmaNode: aPragmaNode [

	"noop"

	
]
