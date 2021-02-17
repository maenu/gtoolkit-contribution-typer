Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraAllPragmas [
	^ self pragmas , (self overriddenMethods flatCollect: #pragmas)
]
