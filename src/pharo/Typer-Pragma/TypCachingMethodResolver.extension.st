Extension { #name : #TypCachingMethodResolver }

{ #category : #'*Typer-Pragma' }
TypCachingMethodResolver class >> typPraResolver [
	^ self new
		selector: #typPraMethodResolverIndex;
		yourself
]
