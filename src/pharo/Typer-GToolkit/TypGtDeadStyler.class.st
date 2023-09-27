Class {
	#name : #TypGtDeadStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtDeadStyler >> styleNode: aNode [
	<typPraArguments: 'RBProgramNode'>
	| nodes |
	nodes := self context nodesAt: aNode.
	(nodes allSatisfy: #isDead) ifFalse: [ ^ self ].
	self
		attributes: {BlTextHighlightAttribute
					paint: BrGlamorousColors errorBackgroundColor}
		from: aNode startWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #accessing }
TypGtDeadStyler >> visitNode: aNode [
	(aNode isReturn or: aNode isPragma) ifFalse: [ self styleNode: aNode ].
	super visitNode: aNode
]
