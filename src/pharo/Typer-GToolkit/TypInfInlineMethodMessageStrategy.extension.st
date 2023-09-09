Extension { #name : #TypInfInlineMethodMessageStrategy }

{ #category : #'*Typer-GToolkit' }
TypInfInlineMethodMessageStrategy >> typGtExpanderCoders [
	^ contexts
		collect: [ :a | 
			a value typGtAsCoder
				attributeNamed: #typGtLookup put: a key;
				yourself ]
]
