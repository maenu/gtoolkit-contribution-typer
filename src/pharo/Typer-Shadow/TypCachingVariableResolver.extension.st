Extension { #name : #TypCachingVariableResolver }

{ #category : #'*Typer-Shadow' }
TypCachingVariableResolver class >> typShaResolver [
	^ self new
		selector: #typShaVariableResolverIndex;
		yourself
]
