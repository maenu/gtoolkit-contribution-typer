Extension { #name : #TypCachingMethodResolver }

{ #category : #'*Typer-Shadow' }
TypCachingMethodResolver class >> typShaResolver [
	^ self new
		selector: #typShaMethodResolverIndex;
		yourself
]
