Extension { #name : #TypInfInlContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlContext >> typGtAsCoder [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtContext put: self;
		forMethod: node compiledMethod;
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfInlContext >> typGtIndicator [
	^ 'i'
]
