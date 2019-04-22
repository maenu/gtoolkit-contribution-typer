Extension { #name : #TypCachingTypeResolver }

{ #category : #'*Typer-Pragma' }
TypCachingTypeResolver class >> typPraResolver [
	^ self new
		selector: #typPraTypeResolverIndex;
		yourself
]
