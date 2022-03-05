Extension { #name : #LiteralVariable }

{ #category : #'*Typer-Inference' }
LiteralVariable >> typInfIsWrittenIn: aCompiledCode [

	^ aCompiledCode writesRef: self
]

{ #category : #'*Typer-Inference' }
LiteralVariable >> typInfType [

	^ self class typAsParametricTypeWithParameters: { 
			  (#B -> Symbol typAsType).
			  (#A -> value typInfType) } asOrderedDictionary
]
