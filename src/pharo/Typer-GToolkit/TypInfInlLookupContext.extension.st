Extension { #name : #TypInfInlLookupContext }

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtAsCoderViewModel [
	^ lookup typGtExpanderMethod
		ifNil: [ GtPharoMethodCoder new
				attributeNamed: #typGtIndicator put: 'l:?';
				forMethod: self class >> #notFound;
				asCoderViewModel ]
		ifNotNil: [ :m | 
			GtPharoMethodCoder new
				attributeNamed: #typGtIndicator put: self typGtIndicator;
				forMethod: m;
				asCoderViewModel ]
]

{ #category : #'*Typer-GToolkit' }
TypInfInlLookupContext >> typGtIndicator [
	^ 'l:', lookup typGtIndicator
]
