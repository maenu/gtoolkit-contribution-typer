Class {
	#name : #TypGtCheStyler,
	#superclass : #TypGtRbAstWithContextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtCheStyler >> styleNode: aNode [
	<typPraArguments: 'RBProgramNode'>
	(coderViewModel typGtContext nodesAt: aNode)
		reject: [ :n | n class = TypInfMessage	"check only specialized messages" ]
		thenDo: [ :n | 
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

{ #category : #accessing }
TypGtCheStyler >> visitMessageNode: aMessage [
	| position |
	position := aMessage keywordsIntervals last stop.
	super visitMessageNode: aMessage.
	(coderViewModel typGtContext nodesAt: aMessage)
		reject: [ :n | n class = TypInfMessage	"check only specialized messages" ]
		thenDo: [ :n | 
			self
				attributes: (n typCheErrors
						collect: [ :e | 
							TypGtCheAttribute
								object: e
								color: e typGtColor
								message: e messageText ])
				from: position
				to: position ]
]

{ #category : #visiting }
TypGtCheStyler >> visitNode: aNode [
	super visitNode: aNode.
	(aNode isValue and: [ aNode isMessage not ]) ifTrue: [ self styleNode: aNode ]
]
