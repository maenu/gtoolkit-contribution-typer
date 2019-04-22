Extension { #name : #TypCachingTypeResolver }

{ #category : #'*Typer-Inference' }
TypCachingTypeResolver class >> typInfResolver [
	^ self new
		selector: #typInfTypeResolverIndex;
		yourself
]
