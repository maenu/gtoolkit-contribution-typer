Extension { #name : #GtPharoSourceCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtBrowseImplementorsAt: anInteger [
	| node |
	node := self typGtRbNodeAt: anInteger.
	node isNil ifTrue: [ ^ self ].
	node isMessage ifFalse: [ ^ self ].
	self
		notifyObjectSpawn: (GtSearchImplementorsFilter selector: node selector)
				& (TypGtCoderTypeFilter new
						type: (self typGtContext type: node);
						yourself)
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtContext [
	attributes at: #typGtContext ifPresent: [ :c | ^ c ].
	attributes at: #typGtContextPromise ifPresent: [ :p | ^ nil ].
	self typGtContextAsync.
	^ nil
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtContextAsync [
	attributes at: #typGtContext ifPresent: [ :c | ^ c asAsyncPromise ].
	attributes at: #typGtContextPromise ifPresent: [ :p | ^ p ].
	^ attributes
		at: #typGtContextPromise
		put: (self rbAST typInfContextLookup resultAsync
				then: [ :c | 
					attributes
						removeKey: #typGtContextPromise;
						at: #typGtContext put: c.
					self requestStyleSourceText.
					c ])
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtHasContext [
	^ attributes includesKey: #typGtContext
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtIndicator [
	^ self
		attributeNamed: #typGtContext
		ifPresent: #typGtIndicator
		ifAbsent: [ self attributeNamed: #typGtIndicator ]
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtInitializeSourceAddOnsFor: anAst into: anAddOns viewModel: aViewModel [
	<gtAstCoderAddOns: 10>
	anAddOns
		addMainAction: 'types' translated
		icon: BrGlamorousIcons traitIcon
		action: [ self typGtToggleTypesInto: anAddOns viewModel: aViewModel ].
	self typGtHasContext
		ifTrue: [ self typGtToggleTypesInto: anAddOns viewModel: aViewModel ]
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtRbNodeAt: anInteger [
	<typPraResult: '{!,RBProgramNode}'>
	^ self rbAST bestNodeFor: (anInteger to: anInteger)
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtShaTypeWithAt: anInteger [
	| node |
	node := self typGtRbNodeAt: anInteger.
	node ifNil: [ ^ self ].
	self
		notifyObjectSpawn: ((self typGtContext nodesAt: node)
				detect: #typGtShaCanType
				ifFound: #typGtShaMethod
				ifNone: [ ^ self ])
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtToggleTypesInto: anAddOns viewModel: aViewModel [
	(anAddOns stylers select: [ :e | e isKindOf: TypGtRbAstWithContextStyler ])
		ifNotEmpty: [ :c | 
			c do: [ :e | anAddOns removeStylersOfClass: e class ].
			anAddOns shortcuts shortcuts
				removeAllSuchThat: [ :s | s class = TypGtBrowseImplementorsShortcut ];
				removeAllSuchThat: [ :s | s class = TypGtShaTypeShortcut ].
			anAddOns
				addStyler: (GtPharoMethodExpanderStyler new
						coderViewModel: aViewModel;
						yourself);
				addStyler: (GtMethodAdviceStyler new
						coderViewModel: aViewModel;
						yourself).
			aViewModel
				completionStrategy: (aViewModel completionStrategy typGtAsPharoCompletionStrategyIn: self) ]
		ifEmpty: [ anAddOns
				addShortcut: TypGtBrowseImplementorsShortcut new;
				addShortcut: TypGtShaTypeShortcut new;
				removeStylersOfClass: GtPharoMethodExpanderStyler;
				removeStylersOfClass: GtMethodAdviceStyler;
				addStyler: (TypGtDeadStyler new
						coderViewModel: aViewModel;
						yourself);
				addStyler: (TypGtContextExpanderStyler new
						coderViewModel: aViewModel;
						yourself);
				addStyler: (TypGtValueStyler new
						coderViewModel: aViewModel;
						yourself);
				addStyler: (TypGtStabilityStyler new
						coderViewModel: aViewModel;
						yourself);
				addStyler: (TypGtCheStyler new
						coderViewModel: aViewModel;
						yourself).
			aViewModel
				completionStrategy: (aViewModel completionStrategy typGtAsCompletionStrategyIn: self) ].
	self requestStyleSourceText
]
