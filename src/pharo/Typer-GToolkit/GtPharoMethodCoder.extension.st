Extension { #name : #GtPharoMethodCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtContextDisable: anAddOns viewModel: aViewModel [
	anAddOns shortcuts removeAllSuchThat: [ :s | s class = TypGtPraTypeShortcut ].
	super typGtContextDisable: anAddOns viewModel: aViewModel
]

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtContextEnable: anAddOns viewModel: aViewModel [
	super typGtContextEnable: anAddOns viewModel: aViewModel.
	anAddOns addShortcut: TypGtPraTypeShortcut new
]

{ #category : #'*Typer-GToolkit' }
GtPharoMethodCoder >> typGtInitializeMethodAddOnsFor: anAst into: anAddOns viewModel: aViewModel [
	"<gtAstCoderAddOns: 11>"
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
	| context node type argumentsPragma resultPragma |
	context := self typGtContext.
	node := context node.
	type := context root type.
	argumentsPragma := RBPragmaNode
			selector: #typPraArguments:
			arguments: {RBLiteralValueNode value: (',' join: (type arguments collect: #asString))}.
	node pragmas
		detect: [ :p | p selector = #typPraArguments: ]
		ifFound: [ :p | 
			node removePragma: p.
			node selector isUnary ifFalse: [ node addPragma: argumentsPragma ] ]
		ifNone: [ node selector isUnary ifFalse: [ node addPragma: argumentsPragma ] ].
	resultPragma := RBPragmaNode
			selector: #typPraResult:
			arguments: {RBLiteralValueNode value: type result asString}.
	node pragmas
		detect: [ :p | p selector = #typPraResult: ]
		ifFound: [ :p | 
			node removePragma: p.
			node addPragma: resultPragma ]
		ifNone: [ node addPragma: resultPragma ].
	self selector = #initialize
		ifTrue: [ context self classDescription instVarNames
				do: [ :s | 
					| variablePragma |
					variablePragma := RBPragmaNode
							selector: #typPraVariable:as:
							arguments: {RBLiteralValueNode value: s asString.
									RBLiteralValueNode
										value: (context self lookupVariable: s asSymbol) asString}.
					node pragmas
						detect: [ :p | p selector = #typPraVariable:as: ]
						ifFound: [ :p | 
							node removePragma: p.
							node addPragma: variablePragma ]
						ifNone: [ node addPragma: variablePragma ] ] ].
	self sourceCode: (GtCoderExplicitStringSource new source: node formattedCode)
]
