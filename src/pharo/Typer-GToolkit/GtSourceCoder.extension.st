Extension { #name : #GtSourceCoder }

{ #category : #'*Typer-GToolkit' }
GtSourceCoder >> typGtBrowseImplementors: anElement [
	<typTypeArgument: 1 as: 'BlElement'>
	| node |
	node := self typGtRbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node isMessage
		ifFalse: [ ^ self ].
	anElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object:
					(TypGtCoderTypeFilter new
						type: (node "typCastAs RBMessageNode") receiver typType;
						yourself) & (GtCoderImplementorsFilter selector: (node "typCastAs RBMessageNode") selector);
				sourceElement: anElement)
]

{ #category : #'*Typer-GToolkit' }
GtSourceCoder >> typGtBrowseToTypeWithPragma: anElement [
	<typTypeArgument: 1 as: 'BlElement'>
	| node |
	node := self typGtRbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	anElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: (node "typCastAs {RBMethodNode,RBMessageNode,RBInstanceVariableNode,RBGlobalNode}") typGtFiltersToTypeWithPragma;
				sourceElement: anElement)
]

{ #category : #'*Typer-GToolkit' }
GtSourceCoder >> typGtBrowseToTypeWithShadow: anElement [
	<typTypeArgument: 1 as: 'BlElement'>
	| node |
	node := self typGtRbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	anElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: (node "typCastAs {RBMethodNode,RBMessageNode,RBInstanceVariableNode,RBGlobalNode}") typGtFiltersToTypeWithShadow;
				sourceElement: anElement)
]

{ #category : #'*Typer-GToolkit' }
GtSourceCoder >> typGtInitializeSourceAddOnsFor: anAst [
	<gtAstCoderAddOns: 10>
	completionStrategy := self newCompletionStrategy.
	(completionStrategy isKindOf: GtPharoCompletionStrategy)
		ifTrue: [ completionStrategy := completionStrategy
				typGtAsTypGtPharoCompletionStrategyFor: self ].
	self flag: 'currently dead code'.
	addOns
		addStyler:
			(TypGtTypeCursorBodyStyler new
				coder: self;
				yourself).
	addOns
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key m;
						build);
				action: [ :e | self typGtBrowseImplementors: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key t;
						build);
				action: [ :e | self typGtBrowseToTypeWithPragma: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key h;
						build);
				action: [ :e | self typGtBrowseToTypeWithShadow: e ]);
		addStyler:
			(TypGtTyperStyler new
				coder: self;
				yourself);
		addStyler: TypGtTypeDeclarationBodyStyler new;
		addStyler: TypGtCheckBodyStyler new;
		addMainAction: 'Types' translated
			icon: BrGlamorousIcons inspect
			action: [ | declaration |
			declaration := addOns stylers
				anySatisfy: [ :e | e class == TypGtTypeDeclarationBodyStyler ].
			declaration
				ifTrue: [ addOns typGtRemoveStylerOfType: TypGtTypeDeclarationBodyStyler.
					addOns addStyler: TypGtTypeValueBodyStyler new ]
				ifFalse: [ addOns typGtRemoveStylerOfType: TypGtTypeValueBodyStyler.
					addOns addStyler: TypGtTypeDeclarationBodyStyler new ].
			self refreshForChanges ]
]

{ #category : #'*Typer-GToolkit' }
GtSourceCoder >> typGtRbNodeAtCursor [
	<typTypeResultAs: '!RBProgramNode'>
	self
		cursorPositionDo: [ :e | 
			[ ^ self rbAST bestNodeFor: (e to: e) ]
				on: Error
				do: [ :f | f return ] ].
	^ nil
]
