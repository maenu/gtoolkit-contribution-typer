Extension { #name : #ClassDescription }

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
