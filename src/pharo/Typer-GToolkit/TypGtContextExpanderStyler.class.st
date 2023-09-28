Class {
	#name : #TypGtContextExpanderStyler,
	#superclass : #TypGtRbAstStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtContextExpanderStyler >> visitMessageNode: aMessage [
	| position |
	position := aMessage keywordsIntervals last stop.
	super visitMessageNode: aMessage.
	(self context nodesAt: aMessage)
		do: [ :n | 
			n typGtExpanderCoders
				do: [ :c | 
					self
						attribute: (TypGtContextExpanderAttribute coder: c in: self coderViewModel)
						from: position
						to: position ] ]
]
