Extension { #name : #TypCachingMethodResolver }

{ #category : #'*Typer-Inference' }
TypCachingMethodResolver class >> typInfResolver [
	^ self new
		selector: #typInfMethodResolverIndex;
		yourself
]
