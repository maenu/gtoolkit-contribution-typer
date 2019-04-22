Extension { #name : #TypCachingVariableResolver }

{ #category : #'*Typer-Inference' }
TypCachingVariableResolver class >> typInfResolver [
	^ self new
		selector: #typInfVariableResolverIndex;
		yourself
]
