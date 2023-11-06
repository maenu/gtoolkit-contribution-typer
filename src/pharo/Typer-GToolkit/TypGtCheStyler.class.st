Class {
	#name : #TypGtCheStyler,
	#superclass : #TypGtRbAstWithContextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtCheStyler >> styleNode: aNode [
	<typPraArguments: 'RBProgramNode'>
	(context nodesAt: aNode)
		do: [ :n | 
			n typCheErrors
				ifNotEmpty: [ :c | 
					self
						attributes: {TypGtCheAttribute
									object: c
									color: c first typGtColor
									message: c first messageText}
						from: aNode stopWithoutParentheses
						to: aNode stopWithoutParentheses ] ]
]

{ #category : #visiting }
TypGtCheStyler >> visitNode: aNode [
	super visitNode: aNode.
	aNode isValue ifTrue: [ self styleNode: aNode ]
]
