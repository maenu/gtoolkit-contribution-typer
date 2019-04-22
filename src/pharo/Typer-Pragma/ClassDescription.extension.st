Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraMethodResolverIndex [
	^ (self methods
		collect: [ :e | e selector asSymbol -> e typPraMethodResolverIndex ])
		as: IdentityDictionary
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraTypeResolverIndex [
	| pragma types |
	pragma := (self methods
		detect: [ :e | e selector = #initialize ]
		ifNone: [ ^ #() ]) pragmas
		detect: [ :e | e selector = #typTypeParametersAs: ]
		ifNone: [ ^ #() ].
	types := (pragma arguments at: 1) typAsTypes.
	^ {(TypTypeResolver new
		type: [ :a | a clazz typAsNamedType asParametricType: types ];
		yourself)}
]

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraVariableResolverIndex [
	| pragmas |
	pragmas := (self methods
		detect: [ :e | e selector = #initialize ]
		ifNone: [ ^ #() ]) pragmas
		select: [ :e | e selector = #typTypeVariable:as: ].
	^ (pragmas
		collect: [ :e | 
			| variable type |
			variable := e arguments at: 1.
			type := (e arguments at: 2) typAsType.
			variable asSymbol
				->
					{(TypVariableResolver new
						type: [ type ];
						yourself)} ]) as: IdentityDictionary
]
