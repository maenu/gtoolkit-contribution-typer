Class {
	#name : #TypGtMethodExpanderStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtMethodExpanderStyler >> visitMessageNode: aMessage [
	| position |
	position := aMessage keywordsIntervals last stop.
	super visitMessageNode: aMessage.
	(self context nodesAt: aMessage)
		do: [ :n | 
			n strategy contexts
				do: [ :c | 
					text
						attribute: c typGtExpander
						from: position
						to: position ] ]
]
