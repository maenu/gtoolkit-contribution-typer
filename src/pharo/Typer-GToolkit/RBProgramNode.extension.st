Extension { #name : #RBProgramNode }

{ #category : #'*Typer-GToolkit' }
RBProgramNode >> typGtAsCoderViewModelFor: aContext [
	^ GtPharoSnippetCoder new
		attributeNamed: #typGtContext put: aContext;
		forSource: self sourceCode;
		asCoderViewModel
]
