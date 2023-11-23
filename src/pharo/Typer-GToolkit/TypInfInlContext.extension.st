Extension { #name : #TypInfInlContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlContext >> typGtAsCoderViewModel [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtContext put: self;
		forMethod: lookup compiledMethod;
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfInlContext >> typGtIndicator [
	^ 'i:', lookup typGtIndicator
]
