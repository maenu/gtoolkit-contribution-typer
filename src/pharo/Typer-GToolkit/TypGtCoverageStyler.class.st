Class {
	#name : #TypGtCoverageStyler,
	#superclass : #TypGtRbAstStyler,
	#category : 'Typer-GToolkit-Typer-GToolkit'
}

{ #category : #accessing }
TypGtCoverageStyler >> styleNode: aNode [

	<typPraArguments: 'RBProgramNode'>
	aNode
		propertyAt: #tagExecuted
		ifPresent: [ :c | 
			self
				styleFrom: aNode start
				to: aNode stop
				with: { (BlTextHighlightAttribute paint: ((c
							   ifTrue: [ Color green ]
							   ifFalse: [ Color red ]) alpha: 0.3) asBlPaint) } ]
		ifAbsent: [  ]
]

{ #category : #accessing }
TypGtCoverageStyler >> visitNode: aNode [
	self styleNode: aNode.
	super visitNode: aNode
]
