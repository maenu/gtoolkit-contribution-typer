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
	^ node start - 1
]

{ #category : #styling }
TypGtRbAstWithContextStyler >> style: aText ast: anAst [
	coderViewModel coderModel typGtContextEnabled ifFalse: [ ^ self ].
	coderViewModel coderModel typGtContext ifNil: [ ^ self	"request style later" ].
	text := aText.
	[ self visitNode: coderViewModel typGtContext node ]
		on: Exception
		do: [ :e | (TypGtStylerErrorSignal new signaledError: e) emit ].
	text := nil
]

{ #category : #visiting }
TypGtRbAstWithContextStyler >> styleNode: aNode [
	| nodes |
	nodes := coderViewModel typGtContext nodesAt: aNode.
	nodes detect: [ :n | n type isUnknown not ] ifNone: [ ^ self ].
	self
		attributes: {TypGtTypeAttribute nodes: nodes}
		from: aNode stopWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #visiting }
TypGtRbAstWithContextStyler >> visitPragmaNode: aPragmaNode [

	"noop"

	
]
