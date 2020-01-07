Extension { #name : #ClassDescription }

{ #category : #'*Typer-Pragma' }
ClassDescription >> typPraAsClassDescriptionLookupResult [
	| pragmas parameters bindings superTypeBindings |
	pragmas := (self lookupSelector: #initialize)
		ifNil: [ ^ nil ]
		ifNotNil: #pragmas.
	parameters := pragmas
		detect: [ :e | e selector = #typParameters: ]
		ifFound: [ :e | e arguments first typAsTypes ]
		ifNone: [ {} ].
	bindings := (parameters asSet collect: [ :e | e name -> e ])
		asDictionary.
	(pragmas select: [ :e | e selector = #typBind:to: ])
		do:
			[ :e | bindings at: e arguments first put: e arguments second typAsType ].
	superTypeBindings := ((pragmas
		select: [ :e | e selector = #typBindSuper:to: ])
		collect: [ :e | e arguments first -> e arguments second typAsType ])
		asDictionary.
	(parameters isEmpty
		and: [ bindings isEmpty and: [ superTypeBindings isEmpty ] ])
		ifTrue: [ ^ nil ].
	(parameters isEmpty
		and: [ bindings isEmpty and: [ superTypeBindings isNotEmpty ] ])
		ifTrue: [ ^ TypClassDescriptionLookupResult new
				type: [ :a | 
					a classDescription
						typAsNamedTypeWithSuperTypeBindings: superTypeBindings ];
				yourself ].
	^ superTypeBindings isEmpty
		ifTrue: [ TypClassDescriptionLookupResult new
				type: [ :a | 
					a classDescription
						typAsParametricTypeWithParameters: parameters
						bindings: bindings ];
				yourself ]
		ifFalse: [ TypClassDescriptionLookupResult new
				type: [ :a | 
					a classDescription
						typAsParametricTypeWithParameters: parameters
						bindings: bindings
						superTypeBindings: superTypeBindings ];
				yourself ]
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
		type: [ :a :s :r | type resolveIn: a receiverType ];
		yourself
]
