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
					paint: BrGlamorousColors neutralBackgroundColor}
		from: aNode start
		to: aNode stop
]

{ #category : #accessing }
TypGtDeadStyler >> visitNode: aNode [
	self styleNode: aNode.
	super visitNode: aNode
]
