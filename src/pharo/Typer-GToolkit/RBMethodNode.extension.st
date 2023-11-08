Extension { #name : #RBMethodNode }

{ #category : #'*Typer-GToolkit' }
RBMethodNode >> typGtAsCoderViewModelFor: aContext [
	^ GtPharoMethodCoder new
		attributeNamed: #typGtContext put: aContext;
		forMethod: self compiledMethod;
		asCoderViewModel
]
