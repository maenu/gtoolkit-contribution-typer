Extension { #name : #TypCachingTypeResolver }

{ #category : #'*Typer-Shadow' }
TypCachingTypeResolver class >> typShaResolver [
	^ self new
		selector: #typShaTypeResolverIndex;
		yourself
]
