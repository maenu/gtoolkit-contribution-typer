Extension { #name : #TypInfInlLookupContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtAsCoder [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtIndicator put: self typGtIndicator;
		forMethod: lookup typGtExpanderMethod;
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtIndicator [
	^ 'l:', lookup typGtIndicator
]
