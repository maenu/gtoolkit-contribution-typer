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
	(self attributes includesKey: #typGtContext)
		ifTrue: [ self typGtToggleTypesInto: anAddOns viewModel: aViewModel ]
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

{ #category : #'*Typer-GToolkit' }
GtPharoSourceCoder >> typGtToggleTypesInto: anAddOns viewModel: aViewModel [
	(anAddOns stylers select: [ :e | e isKindOf: TypGtRbAstWithContextStyler ])
		ifNotEmpty: [ :c | 
			c do: [ :e | anAddOns removeStylersOfClass: e class ].
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
				completionStrategy: (aViewModel completionStrategy typGtAsCompletionStrategyIn: aViewModel) ].
	self requestStyleSourceText
]
