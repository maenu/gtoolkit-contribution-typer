Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsClassLookupResult [
	| pragmas parameters bindings |
	pragmas := (self lookupSelector: #initialize)
		ifNil: [ ^ nil ]
		ifNotNil: #pragmas.
	parameters := pragmas
		detect: [ :e | e selector = #typParameters: ]
		ifFound: [ :e | e arguments first typAsTypes ]
		ifNone: [ {} ].
	bindings := ((pragmas select: [ :e | e selector = #typBind:to: ])
		collect: [ :e | e arguments first typAsType -> e arguments second typAsType ])
		typAsTypeVariableBindings.
	(parameters isEmpty and: [ bindings isEmpty ])
		ifTrue: [ ^ nil ].
	parameters
		ifEmpty: [ ^ TypClassLookupResult new
				type:
						[ :a | a classDescription typAsNamedTypeWithSuperTypeBindings: bindings ];
				yourself ].
	^ TypClassLookupResult new
		type:
				[ :a | a classDescription typAsParametricType: parameters bindings: bindings ];
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
		detect:
			[ :e | e selector = #typTypeVariable:as: and: [ e arguments first = aSymbol ] ]
		ifNone: [ ^ nil ].
	type := pragma arguments second typAsType.
	^ TypVariableLookupResult new
		type: [ :r :a | type resolveIn: a receiverType ];
		yourself
]
