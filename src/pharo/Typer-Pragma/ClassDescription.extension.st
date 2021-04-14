Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraHasType [
	^ (self includesSelector: #initialize)
		and: [ (self >> #initialize) typPraHasTypePragmas ]
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraType [
	self assert: [ self typPraHasType ].
	^ self >> #initialize typPraTypeInject: self typAsNamedType
]
