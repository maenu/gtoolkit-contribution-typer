Class {
	#name : #TypGtCovStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtCovStyler >> styleNode: aNode [
	<typPraArguments: 'RBProgramNode'>
	aNode
		propertyAt: #tagExecuted
		ifPresent: [ :c | 
			self
				attributes: {BlTextHighlightAttribute
							paint: ((c ifTrue: [ Color green ] ifFalse: [ Color red ]) alpha: 0.1)}
				from: aNode startWithoutParentheses
				to: aNode stopWithoutParentheses ]
		ifAbsent: [  "noop" ]
]

{ #category : #accessing }
TypGtCovStyler >> visitNode: aNode [
	aNode isVariable ifFalse: [ self styleNode: aNode ].
	super visitNode: aNode
]
