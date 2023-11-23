Extension { #name : #GtPharoSourceCoder }

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtBrowseImplementorsAt: anInteger [
	| context node |
	context := self typGtContext.
	node := context node bestNodeFor: (anInteger to: anInteger).
	node ifNil: [ ^ self ].
	node isMessage ifFalse: [ ^ self ].
	self
		notifyObjectSpawn: (GtSearchImplementorsFilter selector: node selector)
				& (TypGtCoderTypeFilter new
						type: (context type: node);
						yourself)
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtContext [
	^ self attributes at: #typGtContext ifAbsent: [ nil ]
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtContextDisable: anAddOns viewModel: aViewModel [
	self attributes
		at: #typGtSubscription ifPresent: [ :s | s announcer unsubscribe: self ];
		at: #typGtContextPromise ifPresent: #cancelHard;
		removeKey: #typGtContextEnabled ifAbsent: [  "noop" ];
		removeKey: #typGtSubscription ifAbsent: [  "noop" ];
		removeKey: #typGtContextEnabled ifAbsent: [  "noop" ];
		removeKey: #typGtContext ifAbsent: [  "noop" ];
		removeKey: #typGtContextPromiseSourceCode ifAbsent: [  "noop" ];
		removeKey: #typGtContextPromise ifAbsent: [  "noop" ].
	anAddOns stylers
		removeAllSuchThat: [ :s | s isKindOf: TypGtRbAstWithContextStyler ].
	anAddOns shortcuts
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
		completionStrategy: (aViewModel completionStrategy typGtAsPharoCompletionStrategyIn: self).
	self requestStyleSourceText
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtContextEnable: anAddOns viewModel: aViewModel [
	self attributes at: #typGtContextEnabled put: true.
	anAddOns
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
		addStyler: (TypGtCheStyler new
				coderViewModel: aViewModel;
				yourself);
		addStyler: (TypGtValueStyler new
				coderViewModel: aViewModel;
				yourself);
		addStyler: (TypGtStabilityStyler new
				coderViewModel: aViewModel;
				yourself).
	aViewModel
		completionStrategy: (aViewModel completionStrategy typGtAsCompletionStrategyIn: aViewModel).
	aViewModel typGtContext
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtContextEnabled [
	self attributes
		at: #typGtContextEnabled ifPresent: [ :b | ^ true ];
		at: #typGtContext
			ifPresent: [ :b | ^ self attributes at: #typGtContextEnabled put: true ].
	^ false
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
		action: [ self typGtContextEnabled
				ifTrue: [ self typGtContextDisable: anAddOns viewModel: aViewModel ]
				ifFalse: [ self typGtContextEnable: anAddOns viewModel: aViewModel ] ].
	self typGtContextEnabled
		ifTrue: [ self typGtContextEnable: anAddOns viewModel: aViewModel ]
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtShaTypeWithAt: anInteger [
	| context node |
	context := self typGtContext.
	node := context node bestNodeFor: (anInteger to: anInteger).
	node ifNil: [ ^ self ].
	self
		notifyObjectSpawn: ((context nodesAt: node)
				detect: #typGtShaCanType
				ifFound: #typGtShaMethod
				ifNone: [ ^ self ])
]
