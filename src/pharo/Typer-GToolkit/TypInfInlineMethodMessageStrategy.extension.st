Extension { #name : #TypInfInlineMethodMessageStrategy }

{ #category : #'*Typer-GToolkit' }
TypInfInlineMethodMessageStrategy >> typGtExpanderCoders [
	^ contexts
		collect: [ :a | 
			| model |
			model := a value typGtAsCoder.
			model coderModel attributeNamed: #typGtLookup put: a key.
			model ]
]
