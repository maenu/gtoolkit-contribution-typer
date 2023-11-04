Extension { #name : #TypInfInlContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlContext >> typGtAsCoder [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtContext put: self;
		forMethod: lookup typGtExpanderMethod;
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfInlContext >> typGtIndicator [
	^ 'i:', lookup typGtIndicator
]
