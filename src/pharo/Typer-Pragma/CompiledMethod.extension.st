Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraAllPragmas [
	^ self pragmas , (self overriddenMethods flatCollect: #pragmas)
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraAsMethodLookupResult [
	| pragmas argumentPragmas resultPragma signalsAlwaysPragma argumentTypes resultType isReturnSelf signalsAlways |
	pragmas := self typPraAllPragmas.
	argumentPragmas := ((pragmas
		select: [ :e | e selector = #typTypeArgument:as: ])
		groupedBy: [ :e | e arguments at: 1 ]) collect: #first.
	resultPragma := pragmas
		detect: [ :e | e selector = #typTypeResultAs: ]
		ifNone: [ nil ].
	signalsAlwaysPragma := pragmas
		detect: [ :e | e selector = #typSignalsAlways: ]
		ifNone: [ nil ].
	(argumentPragmas isEmpty
		and: [ resultPragma isNil and: [ signalsAlwaysPragma isNil ] ])
		ifTrue: [ ^ nil ].
	argumentTypes := self numArgs
		timesCollect: [ :i | 
			argumentPragmas
				at: i
				ifPresent: [ :e | (e arguments at: 2) typAsType ]
				ifAbsent: [ TypUnknownType instance ] ].
	resultType := resultPragma
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ (resultPragma arguments at: 1) typAsType ].
	isReturnSelf := self ast typIsReturnSelf.
	signalsAlways := signalsAlwaysPragma
		ifNil: [ nil ]
		ifNotNil: [ signalsAlwaysPragma arguments at: 1 ].
	^ TypMethodLookupResult new
		argumentTypes: [ :i | argumentTypes at: i ];
		resultType: [ :a | 
			(resultType isUnknown and: [ isReturnSelf ])
				ifTrue: [ a receiverType ]
				ifFalse: [ resultType ] ];
		signalsAlways: [ signalsAlways ];
		yourself
]
