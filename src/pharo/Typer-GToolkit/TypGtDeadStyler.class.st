Class {
	#name : #TypGtDeadStyler,
	#superclass : #TypGtRbAstWithContextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtDeadStyler >> styleNode: aNode [
	<typPraArguments: 'RBProgramNode'>
	self
		attributes: {BlTextHighlightAttribute
					paint: (((context nodesAt: aNode) allSatisfy: #isDead)
							ifTrue: BrGlamorousColors errorBackgroundColor
							ifFalse: Color white)}
		from: aNode startWithoutParentheses
		to: aNode stopWithoutParentheses
]

{ #category : #accessing }
TypGtDeadStyler >> visitNode: aNode [
	(aNode isReturn or: aNode isPragma) ifFalse: [ self styleNode: aNode ].
	super visitNode: aNode
]
