Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraAsMethodLookupResult [
	| argumentPragmas resultPragma signalsAlwaysPragma argumentTypes resultType signalsAlways |
	self flag: 'FIXME lookup overriden method chain'.
	argumentPragmas := self pragmas
		select: [ :e | e selector = #typTypeArgument:as: ].
	resultPragma := self pragmas
		detect: [ :e | e selector = #typTypeResultAs: ]
		ifNone: [ nil ].
	signalsAlwaysPragma := self pragmas
		detect: [ :e | e selector = #typSignalsAlways: ]
		ifNone: [ nil ].
	(argumentPragmas isEmpty
		and: [ resultPragma isNil and: [ signalsAlwaysPragma isNil ] ])
		ifTrue: [ ^ nil ].
	argumentTypes := self numArgs
		timesCollect: [ :i | 
			argumentPragmas
				detect: [ :e | (e arguments at: 1) = i ]
				ifFound: [ :e | (e arguments at: 2) typAsType ]
				ifNone: [ TypUnknownType instance ] ].
	resultType := resultPragma
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ resultPragma arguments first typAsType ].
	signalsAlways := signalsAlwaysPragma
		ifNil: [ nil ]
		ifNotNil: [ signalsAlwaysPragma arguments first ].
	^ TypMethodLookupResult new
		argumentTypes: [ :i | argumentTypes at: i ];
		resultType: [ resultType ];
		signalsAlways: [ signalsAlways ];
		yourself
]
