Extension { #name : #CompiledMethod }

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraAllPragmas [
	^ self pragmas , (self overriddenMethods flatCollect: #pragmas)
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraArguments [
	| arguments |
	arguments := (1 to: self numArgs)
		collect: [ :i | TypUnknownType new ].
	self pragmas
		select: [ :e | e selector = #typTypeArgument:as: ]
		thenDo:
			[ :e | arguments at: e arguments first put: e arguments second typAsType ].
	^ arguments
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraResult [
	^ self pragmas
		detect: [ :e | e selector = #typTypeResultAs: ]
		ifFound: [ :e | e arguments first typAsType ]
		ifNone: [ TypUnknownType new ]
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraSignalsAlways [
	^ self pragmas
		detect: [ :e | e selector = #typSignalsAlways: ]
		ifFound: [ :e | e arguments first ]
		ifNone: [ nil ]
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraType [
	^ TypFunctionType
		classDescription: self class
		result: self typPraResult
		arguments: self typPraArguments
		argumentsOptional: false
		signalsAlways: self typPraSignalsAlways
]

{ #category : #'*Typer-Pragma' }
CompiledMethod >> typPraTypeInject: aType [
	^ self pragmas inject: aType into: [ :t :p | p typPraTypeInject: t ]
]
