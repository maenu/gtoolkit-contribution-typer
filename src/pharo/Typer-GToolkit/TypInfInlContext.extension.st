Extension { #name : #TypInfInlContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlContext >> typGtAsCoder [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtContext put: self;
		attributeNamed: #typGtLookup put: root lookup;
		forMethod: node compiledMethod;
		asCoderViewModel
]

{ #category : #'*Typer-GToolkit' }
TypInfInlContext >> typGtIndicator [
	^ 'i'
]
