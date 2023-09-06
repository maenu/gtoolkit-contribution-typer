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
				 type: node receiver typInfTypeSelf;
				 yourself)
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtInitializeSourceAddOnsFor: anAst into: anAddOns viewModel: aViewModel [
	"initializeAddOns: addOns viewModel: aViewModel"

	"self completionStrategy:
		(self completionStrategy typGtAsCompletionStrategy
			 coder: self;
			 yourself)."

	<gtAstCoderAddOns: 10>
	anAddOns
		addShortcut: TypGtBrowseImplementorsShortcut new;
		addShortcut: TypGtTypeWithPragmaShortcut new;
		addShortcut: TypGtTypeWithShadowShortcut new;
		addMainAction: 'declarations' translated
			icon: BrGlamorousIcons inspect
			action: [ anAddOns stylers
					detect: [ :e | e isKindOf: TypGtRbAstStyler ]
					ifFound: [ :e | anAddOns stylers remove: e ]
					ifNone: [ anAddOns
							addStyler: (TypGtDeclarationStyler new
									coderViewModel: aViewModel;
									yourself) ].
				self requestStyleSourceText ];
		addMainAction: 'all' translated
			icon: BrGlamorousIcons inspect
			action: [  "addStyler: (TypGtValueStyler new
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
			self styleText ]"(anAddOns
					stylers select: [ :e | e isKindOf: TypGtRbAstStyler ])
					ifNotEmpty: [ :c | 
						c do: [ :e | anAddOns removeStylersOfClass: e class ].
						anAddOns
							addStyler: (GtPharoMethodExpanderStyler new
									coderViewModel: aViewModel;
									yourself) ]
					ifEmpty: [ anAddOns
							removeStylersOfClass: GtPharoMethodExpanderStyler;
							addStyler: (TypGtValueStyler new
									coderViewModel: aViewModel;
									yourself);
							addStyler: (TypGtContextExpanderStyler new
									coderViewModel: aViewModel;
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
