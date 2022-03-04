Extension { #name : #GtPharoSourceCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtBrowseImplementorsAt: anInteger [

	<typPraArguments: 'Integer'>
	| node |
	node := self typGtRbNodeAt: anInteger.
	node isNil ifTrue: [ ^ self ].
	node isMessage ifFalse: [ ^ self ].
	self notifyObjectSpawn:
		(GtSearchImplementorsFilter selector: node selector)
		& (TypGtCoderTypeFilter new
				 type: node receiver typInfTypeInSelf;
				 yourself)
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtInitializeSourceAddOnsFor: anAst into: anAddOns [

	"self completionStrategy:
		(self completionStrategy typGtAsCompletionStrategy
			 coder: self;
			 yourself)."

	<gtAstCoderAddOns: 10>
	anAddOns
		addShortcut: TypGtBrowseImplementorsShortcut new;
		addShortcut: TypGtTypeWithPragmaShortcut new;
		addShortcut: TypGtTypeWithShadowShortcut new;
		"addStyler: (TypGtValueStyler new
				 coder: self;
				 yourself);""addStyler: (TypGtCheckStyler new
				 coder: self;
				 yourself);
		addStyler: (TypGtCoverageStyler new
				 coder: self;
				 yourself);""addStyler: (TypGtCursorStyler new
				 coder: self;
				 yourself);
		addMainAction: 'Unknowns' translated
			icon: BrGlamorousIcons minimize
			action: [ | checker |
			checker := anAddOns stylers
				detect: [ :e | e class == TypGtCheckBodyStyler ].
			checker markUnknowns: checker markUnknowns not.
			self styleText ]"
		addMainAction: 'declarations' translated
		icon: BrGlamorousIcons inspect
		action: [ 
			anAddOns stylers
				detect: [ :e | e isKindOf: TypGtRbAstStyler ]
				ifFound: [ :e | anAddOns stylers remove: e ]
				ifNone: [ 
					anAddOns addStyler: (TypGtDeclarationStyler new
								 coder: self;
								 yourself) ].
			self requestStyleSourceText ];
		addMainAction: 'all' translated
		icon: BrGlamorousIcons inspect
		action: [ 
			anAddOns stylers
				detect: [ :e | e isKindOf: TypGtRbAstStyler ]
				ifFound: [ :e | anAddOns stylers remove: e ]
				ifNone: [ 
					anAddOns addStyler: (TypGtValueStyler new
							 coder: self;
							 yourself) ].
			self requestStyleSourceText ]
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtRbNodeAt: anInteger [

	<typPraResult: '{!,RBProgramNode}'>
	^ self rbAST bestNodeFor: (anInteger to: anInteger)
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtTypeWithShadowAt: anInteger [

	<typPraArguments: 'Integer'>
	| node |
	node := self typGtRbNodeAt: anInteger.
	node isNil ifTrue: [ ^ self ].
	node typGtCanType ifFalse: [ ^ self ].
	self notifyObjectSpawn: node typGtShadowMethod
]
