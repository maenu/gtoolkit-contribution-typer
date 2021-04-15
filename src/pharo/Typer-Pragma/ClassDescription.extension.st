Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraHasMethod: aSymbol [
	^ (self includesSelector: aSymbol)
		and: [ (self >> aSymbol) typPraHasMethodPragmas ]
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraHasType [
	^ (self includesSelector: #initialize)
		and: [ (self >> #initialize) typPraHasTypePragmas ]
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraHasVariable: aString [
	^ (self includesSelector: #initialize)
		and: [ self >> #initialize typPraHasVariablePragma: aString ]
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraMethod: aSymbol [
	self assert: [ self typPraHasMethod: aSymbol ].
	^ (self >> aSymbol) typPraType
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraType [
	self assert: [ self typPraHasType ].
	^ (self >> #initialize typPraTypeInject: self typAsNamedType)
		addOrigin: (TypPraMethodOrigin method: self >> #initialize);
		yourself
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraVariable: aString [
	self assert: [ self typPraHasVariable: aString ].
	^ (self >> #initialize typPraVariable: aString)
		addOrigin: (TypPraMethodOrigin method: self >> #initialize);
		yourself
]
