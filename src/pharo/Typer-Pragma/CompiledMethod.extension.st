Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraAllPragmas [
	^ self pragmas , (self overriddenMethods flatCollect: #pragmas)
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraAsMethodLookupResult [
	| pragmas argumentPragmas resultPragma signalsAlwaysPragma argumentTypes resultType signalsAlways |
	pragmas := self typPraAllPragmas.
	argumentPragmas := ((pragmas
		select: [ :e | e selector = #typTypeArgument:as: ])
		groupedBy: [ :e | e arguments first ]) collect: #first.
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
				ifPresent: [ :e | e arguments second typAsType ]
				ifAbsent: [ TypUnknownType instance ] ].
	resultType := resultPragma
		ifNil: [ TypUnknownType instance ]
		ifNotNil: [ resultPragma arguments first typAsType ].
	signalsAlways := signalsAlwaysPragma
		ifNil: [ nil ]
		ifNotNil: [ signalsAlwaysPragma arguments first ].
	^ TypMethodLookupResult new
		argumentTypes: [ :i :r :a | (argumentTypes at: i) resolveIn: a receiverType ];
		resultType: [ :a :s :r | resultType resolveIn: a receiverType ];
		signalsAlways: [ signalsAlways ];
		yourself
]
