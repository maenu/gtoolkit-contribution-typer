Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsClassLookupResult [
	| pragmas pragma types |
	pragmas := (self lookupSelector: #initialize)
		ifNil: [ ^ nil ]
		ifNotNil: #typPraAllPragmas.
	pragma := pragmas
		detect: [ :e | e selector = #typTypeParametersAs: ]
		ifNone: [ ^ nil ].
	types := (pragma arguments at: 1) typAsTypes.
	^ TypClassLookupResult new
		type: [ :a | a clazz typAsNamedType asParametricType: types ];
		yourself
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsMethodLookupResultFor: aSymbol [
	^ (self lookupSelector: aSymbol)
		ifNil: [ ^ nil ]
		ifNotNil: #typPraAsMethodLookupResult
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsVariableLookupResultFor: aSymbol [
	| pragmas pragma type |
	pragmas := (self lookupSelector: #initialize)
		ifNil: [ ^ nil ]
		ifNotNil: #typPraAllPragmas.
	pragma := pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ (e arguments at: 1) = aSymbol ] ]
		ifNone: [ ^ nil ].
	type := (pragma arguments at: 2) typAsType.
	^ TypVariableLookupResult new
		type: [ type ];
		yourself
]
