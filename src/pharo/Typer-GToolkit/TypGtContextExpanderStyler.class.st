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
	(coderViewModel typGtContext nodesAt: aMessage)
		do: [ :n | 
			n typGtExpanderCoderViewModels
				do: [ :c | 
					| attribute |
					attribute := TypGtContextExpanderAttribute new
							coderViewModel: c;
							yourself.
					coderViewModel announcer weak
						when: TypGtExpandContextRequest
						send: #onRequestExpandContext:
						to: attribute.
					self
						attribute: attribute
						from: position
						to: position ] ]
]
