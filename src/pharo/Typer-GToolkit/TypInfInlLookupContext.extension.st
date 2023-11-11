Extension { #name : #TypInfInlLookupContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtAsCoderViewModel [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtIndicator put: self typGtIndicator;
		forMethod: (lookup typGtExpanderMethod ifNil: [ self class >> #noMethod ]);
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtIndicator [
	^ 'l:', lookup typGtIndicator
]
