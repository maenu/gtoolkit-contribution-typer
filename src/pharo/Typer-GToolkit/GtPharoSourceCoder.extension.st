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
	^ self attributeNamed: #typGtContext
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtIndicator [
	^ (self
		attributeNamed: #typGtContext
		ifPresent: #typGtIndicator
		ifAbsent: 'l') , ':'
		, (self
				attributeNamed: #typGtLookup
				ifPresent: #typGtIndicator
				ifAbsent: '')
]

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtInitializeSourceAddOnsFor: anAst into: anAddOns viewModel: aViewModel [
	"<gtAstCoderAddOns: 10>"
	aViewModel
		completionStrategy: (aViewModel completionStrategy typGtAsCompletionStrategyIn: self).
	self
		attributeNamed: #typGtContext
		ifPresent: [ self
				typGtToggleStylersAllFor: anAst
				into: anAddOns
				viewModel: aViewModel ]
		ifAbsent: [  "noop" ].
	anAddOns
		addShortcut: TypGtBrowseImplementorsShortcut new;
		addShortcut: TypGtPraTypeShortcut new;
		addShortcut: TypGtShaTypeShortcut new;
		addMainAction: 'types' translated
			icon: BrGlamorousIcons traitIcon
			action: [ self
					typGtToggleStylersAllFor: anAst
					into: anAddOns
					viewModel: aViewModel.
				self requestStyleSourceText ]
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
GtPharoSourceCoder >> typGtToggleStylersAllFor: anAst into: anAddOns viewModel: aViewModel [
	(anAddOns stylers select: [ :e | e isKindOf: TypGtRbAstStyler ])
		ifNotEmpty: [ :c | 
			c do: [ :e | anAddOns removeStylersOfClass: e class ].
			anAddOns
				addStyler: (GtPharoMethodExpanderStyler new
						coderViewModel: aViewModel;
						yourself);
				addStyler: (GtMethodAdviceStyler new
						coderViewModel: aViewModel;
						yourself) ]
		ifEmpty: [ anAddOns
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
				addStyler: (TypGtCheStyler new
						coderViewModel: aViewModel;
						yourself);
				addStyler: (TypGtCovStyler new
						coderViewModel: aViewModel;
						yourself) ]
]
