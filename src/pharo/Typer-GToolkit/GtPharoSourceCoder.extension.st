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
				 type: (node receiver typInfTypeIn: node typGtSelf);
				 yourself)
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtBrowseToTypeWithPragmaAt: anInteger [
	<typPraArguments: 'Integer'>
	| node |
	node := self typGtRbNodeAt: anInteger.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	self notifyObjectSpawn: node typGtFiltersToTypeWithPragma
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtInitializeSourceAddOnsFor: anAst into: anAddOns [

	<gtAstCoderAddOns: 10>
	self completionStrategy:
		(self completionStrategy typGtAsCompletionStrategy
			 coder: self;
			 yourself).
	anAddOns
		addStyler: (TypGtDeclarationStyler new
				 coder: self;
				 yourself);
		addStyler: (TypGtCheckStyler new
				 coder: self;
				 yourself);
		addStyler: (TypGtCoverageStyler new
				 coder: self;
				 yourself);
		"addStyler: (TypGtCursorStyler new
				 coder: self;
				 yourself);"
		addShortcut: TypGtBrowseImplementorsShortcut new;
		addShortcut: TypGtTypeWithPragmaShortcut new;
		addShortcut: TypGtTypeWithShadowShortcut new
	"anAddOns
		addMainAction: 'Types' translated
			icon: BrGlamorousIcons inspect
			action: [ | declaration |
			declaration := anAddOns stylers
				anySatisfy: [ :e | e class == TypGtTypeDeclarationBodyStyler ].
			declaration
				ifTrue: [ anAddOns
						typGtReplaceStylerOfType: TypGtTypeDeclarationBodyStyler
						with: TypGtTypeValueBodyStyler new ]
				ifFalse: [ anAddOns
						typGtReplaceStylerOfType: TypGtTypeValueBodyStyler
						with: TypGtTypeDeclarationBodyStyler new ] ];
		addMainAction: 'Unknowns' translated
			icon: BrGlamorousIcons minimize
			action: [ | checker |
			checker := anAddOns stylers
				detect: [ :e | e class == TypGtCheckBodyStyler ].
			checker markUnknowns: checker markUnknowns not.
			self styleText ]"
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
