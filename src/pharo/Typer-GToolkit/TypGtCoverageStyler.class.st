Class {
	#name : #TypGtCoverageStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtCoverageStyler >> styleNode: aNode [
	<typPraArguments: 'RBProgramNode'>
	aNode
		propertyAt: #tagExecuted
		ifPresent: [ :c | 
			self
				attributes: {BlTextHighlightAttribute
							paint: ((c ifTrue: [ Color green ] ifFalse: [ Color red ]) alpha: 0.3) asBlPaint}
				from: aNode start
				to: aNode stop ]
		ifAbsent: [  ]
]

{ #category : #accessing }
TypGtCoverageStyler >> visitNode: aNode [
	self styleNode: aNode.
	super visitNode: aNode
]
