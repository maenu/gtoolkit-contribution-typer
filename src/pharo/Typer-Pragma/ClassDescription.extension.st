Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsClassLookupResult [
	| pragma types |
	self flag: 'FIXME lookup overriden method chain'.
	pragma := (self methods
		detect: [ :e | e selector = #initialize ]
		ifNone: [ ^ nil ]) pragmas
		detect: [ :e | e selector = #typTypeParametersAs: ]
		ifNone: [ ^ nil ].
	types := (pragma arguments at: 1) typAsTypes.
	^ TypClassLookupResult new
		type: [ :a | a clazz typAsNamedType asParametricType: types ];
		yourself
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsMethodLookupResultFor: aSymbol [
	^ self methodDict
		at: aSymbol
		ifPresent: #typPraAsMethodLookupResult
		ifAbsent: [ nil ]
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsVariableLookupResultFor: aSymbol [
	| pragma |
	self flag: 'FIXME lookup overriden method chain'.
	pragma := (self methods
		detect: [ :e | e selector = #initialize ]
		ifNone: [ ^ nil ]) pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ (e arguments at: 1) = aSymbol ] ]
		ifNone: [ ^ nil ].
	^ TypClassLookupResult new
		type: [ (pragma arguments at: 2) typAsType ];
		yourself
]
