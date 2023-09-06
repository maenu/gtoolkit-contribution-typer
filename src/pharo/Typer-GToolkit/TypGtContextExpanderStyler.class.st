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
			n strategy contexts
				do: [ :c | 
					text
						attribute: (TypGtContextExpanderAttribute lookup: c key context: c value)
						from: position
						to: position ] ]
]
