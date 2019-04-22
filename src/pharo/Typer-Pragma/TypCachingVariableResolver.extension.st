Extension { #name : #TypCachingVariableResolver }

{ #category : #'*Typer-Pragma' }
TypCachingVariableResolver class >> typPraResolver [
	^ self new
		selector: #typPraVariableResolverIndex;
		yourself
]
