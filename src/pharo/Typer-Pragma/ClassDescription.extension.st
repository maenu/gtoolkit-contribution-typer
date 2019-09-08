Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsClassResolver [
	| pragma types |
	pragma := (self methods
		detect: [ :e | e selector = #initialize ]
		ifNone: [ ^ TypClassLookupResult empty ]) pragmas
		detect: [ :e | e selector = #typTypeParametersAs: ]
		ifNone: [ ^ TypClassLookupResult empty ].
	types := (pragma arguments at: 1) typAsTypes.
	^ TypClassLookupResult new
		type: [ :a | a clazz typAsNamedType asParametricType: types ];
		yourself
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsMethodResolverFor: aSymbol [
	^ self methodDict
		at: aSymbol
		ifPresent: #typPraAsMethodResolver
		ifAbsent: [ TypMethodLookupResult empty ]
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsVariableResolverFor: aSymbol [
	| pragma |
	pragma := (self methods
		detect: [ :e | e selector = #initialize ]
		ifNone: [ ^ TypVariableLookupResult empty ]) pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ (e arguments at: 1) = aSymbol ] ]
		ifNone: [ ^ TypVariableLookupResult empty ].
	^ TypClassLookupResult new
		type: [ (pragma arguments at: 2) typAsType ];
		yourself
]
