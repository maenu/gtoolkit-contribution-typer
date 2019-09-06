Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsMethodResolverFor: aSymbol [
	^ self methodDict
		at: aSymbol
		ifPresent: #typPraAsMethodResolver
		ifAbsent: [ TypMethodResolver new ]
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsTypeResolver [
	| pragma types |
	pragma := (self methods
		detect: [ :e | e selector = #initialize ]
		ifNone: [ ^ TypTypeResolver new ]) pragmas
		detect: [ :e | e selector = #typTypeParametersAs: ]
		ifNone: [ ^ TypTypeResolver new ].
	types := (pragma arguments at: 1) typAsTypes.
	^ TypTypeResolver new
		type: [ :a | a clazz typAsNamedType asParametricType: types ];
		yourself
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsVariableResolverFor: aSymbol [
	| pragma |
	pragma := (self methods
		detect: [ :e | e selector = #initialize ]
		ifNone: [ ^ TypVariableResolver new ]) pragmas
		detect: [ :e | 
			e selector = #typTypeVariable:as:
				and: [ (e arguments at: 1) = aSymbol ] ]
		ifNone: [ ^ TypVariableResolver new ].
	^ TypTypeResolver new
		type: [ (pragma arguments at: 2) typAsType ];
		yourself
]
