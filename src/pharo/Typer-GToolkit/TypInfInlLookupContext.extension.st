Extension { #name : #TypInfInlLookupContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtAsCoder [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtContext put: self;
		forMethod: lookup method;
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtHasCoder [
	^ root lookup isNotNil
]

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtIndicator [
	^ 'l'
]
