Extension { #name : #TypInfLookupMessageStrategy }

{ #category : #'*Typer-GToolkit' }
TypInfLookupMessageStrategy >> typGtExpanderCoders [
	| lookup |
	lookup := message lookup resolved.
	^ {GtPharoMethodCoder new
			attributeNamed: #typGtLookup put: lookup;
			forMethod: (lookup resolver typGtExpanderMethod: lookup);
			yourself}
]
