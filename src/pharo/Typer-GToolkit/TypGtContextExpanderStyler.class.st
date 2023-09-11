Class {
	#name : #TypGtContextExpanderStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit'
}

{ #category : #accessing }
TypGtContextExpanderStyler >> visitMessageNode: aMessage [
	| position |
	position := aMessage keywordsIntervals last stop.
	super visitMessageNode: aMessage.
	(self context nodesAt: aMessage)
		do: [ :n | 
			n strategy typGtExpanderCoders
				do: [ :c | 
					self
						attribute: (TypGtContextExpanderAttribute coder: c)
						from: position
						to: position ] ]
]
