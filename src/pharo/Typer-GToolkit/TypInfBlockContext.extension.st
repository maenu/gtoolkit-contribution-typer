Extension { #name : #TypInfBlockContext }

{ #category : #'*Typer-GToolkit' }
TypInfBlockContext >> typGtAsCoder [
	^ (GtPharoSnippetCoder new
		attributeNamed: #typGtContext put: self;
		forSource: node body sourceCode;
		asCoderViewModel)
		selfObject: self self classDescription;
		yourself
]
