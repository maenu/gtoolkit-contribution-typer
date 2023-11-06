Class {
	#name : #TypGtContextExpanderStyler,
	#superclass : #TypGtRbAstWithContextStyler,
	#category : #'Typer-GToolkit-Core'
}

{ #category : #accessing }
TypGtContextExpanderStyler >> visitMessageNode: aMessage [
	| position |
	position := aMessage keywordsIntervals last stop.
	super visitMessageNode: aMessage.
	(context nodesAt: aMessage)
		do: [ :n | 
			n typGtExpanderCoders
				do: [ :c | 
					self
						attribute: (TypGtContextExpanderAttribute coder: c in: self coderViewModel)
						from: position
						to: position ] ]
]
