Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsClassLookupResult [
	| pragmas parameters |
	pragmas := (self lookupSelector: #initialize)
		ifNil: [ ^ nil ]
		ifNotNil: #pragmas.
	pragmas := pragmas
		select: [ :e | e selector = #typTypeParameter:as: ].
	pragmas ifEmpty: [ ^ nil ].
	self
		assert: [ | names |
			names := pragmas collect: [ :e | e arguments first ].
			names size = names asSet size ].
	parameters := (pragmas
		collect: [ :e | 
			(TypTypeVariableType named: e arguments first)
				-> e arguments second typAsType ]) asOrderedDictionary.
	^ TypClassLookupResult new
		type:
				[ :a | a classDescription typAsNamedType asParametricType: parameters ];
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
