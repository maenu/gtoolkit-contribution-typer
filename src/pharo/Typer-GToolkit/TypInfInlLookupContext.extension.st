Extension { #name : #TypInfInlLookupContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtAsCoder [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtLookup put: root lookup;
		forMethod: (root lookup resolver typGtExpanderMethod: root lookup);
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtIndicator [
	^ 'l'
]
