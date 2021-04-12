Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraType [
	^ self >> #initialize typPraTypeInject: self typAsNamedType
]
