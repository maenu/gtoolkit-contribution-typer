Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtInitializeMethodAddOnsFor: anAst into: anAddOns viewModel: aViewModel [
	<gtAstCoderAddOns: 11>
	anAddOns
		addStyler: (TypGtCovStyler new
				coderViewModel: aViewModel;
				yourself);
		addMainAction: 'instrument' translated
			icon: BrGlamorousIcons classicon
			action: [ self compiledMethod typCovInstrument ]
]

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtPraType [
	| ast selfType type argumentsPragma resultPragma |
	ast := self rbAST.
	selfType := self typGtContext self.
	type := self typGtContext root type.
	argumentsPragma := RBPragmaNode
			selector: #typPraArguments:
			arguments: {RBLiteralValueNode value: (',' join: (type arguments collect: #asString))}.
	ast pragmas
		detect: [ :p | p selector = #typPraArguments: ]
		ifFound: [ :p | 
			ast removePragma: p.
			ast selector isUnary ifFalse: [ ast addPragma: argumentsPragma ] ]
		ifNone: [ ast selector isUnary ifFalse: [ ast addPragma: argumentsPragma ] ].
	resultPragma := RBPragmaNode
			selector: #typPraResult:
			arguments: {RBLiteralValueNode value: type result asString}.
	ast pragmas
		detect: [ :p | p selector = #typPraResult: ]
		ifFound: [ :p | 
			ast removePragma: p.
			ast addPragma: resultPragma ]
		ifNone: [ ast addPragma: resultPragma ].
	self selector = #initialize
		ifTrue: [ selfType classDescription instVarNames
				do: [ :s | 
					| variablePragma |
					variablePragma := RBPragmaNode
							selector: #typPraVariable:as:
							arguments: {RBLiteralValueNode value: s asString.
									RBLiteralValueNode
										value: (selfType lookupVariable: s asSymbol) asString}.
					ast pragmas
						detect: [ :p | p selector = #typPraVariable:as: ]
						ifFound: [ :p | 
							ast removePragma: p.
							ast addPragma: variablePragma ]
						ifNone: [ ast addPragma: variablePragma ] ] ].
	self sourceCode: (GtCoderExplicitStringSource new source: ast formattedCode)
]

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtToggleTypesInto: anAddOns viewModel: aViewModel [
	(anAddOns stylers select: [ :e | e isKindOf: TypGtRbAstWithContextStyler ])
		ifNotEmpty: [ :c | 
			anAddOns shortcuts shortcuts
				removeAllSuchThat: [ :s | s class = TypGtPraTypeShortcut ] ]
		ifEmpty: [ anAddOns addShortcut: TypGtPraTypeShortcut new ].
	super typGtToggleTypesInto: anAddOns viewModel: aViewModel
]
