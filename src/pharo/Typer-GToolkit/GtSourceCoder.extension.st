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
						yourself) & (GtSearchImplementorsFilter selector: (node "typCastAs RBMessageNode") selector);
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
GtSourceCoder >> typGtInitializeSourceAddOnsFor: anAst into: anAddOns [
	"<gtAstCoderAddOns: 10>"
	self completionStrategy class == GtPharoCompletionStrategy
		ifTrue: [ completionStrategy := completionStrategy
				typGtAsTypGtPharoCompletionStrategyFor: self ].
	self flag: 'currently dead code'.
	"addOns
		addStyler:
			(TypGtTypeCursorBodyStyler new
				coder: self;
				yourself)."
	anAddOns
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: BlKeyboardKey m;
						build);
				action: [ :e | self typGtBrowseImplementors: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: BlKeyboardKey t;
						build);
				action: [ :e | self typGtBrowseToTypeWithPragma: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: BlKeyboardKey h;
						build);
				action: [ :e | self typGtBrowseToTypeWithShadow: e ]);
		addStyler: TypGtTypeDeclarationBodyStyler new;
		addStyler:
			(TypGtCheckBodyStyler new
				coder: self;
				yourself);
		addMainAction: 'Types' translated
			icon: BrGlamorousIcons inspect
			action: [ | declaration |
			declaration := anAddOns stylers
				anySatisfy: [ :e | e class == TypGtTypeDeclarationBodyStyler ].
			declaration
				ifTrue: [ anAddOns typGtReplaceStylerOfType: TypGtTypeDeclarationBodyStyler with: TypGtTypeValueBodyStyler new ]
				ifFalse: [ anAddOns typGtReplaceStylerOfType: TypGtTypeValueBodyStyler with: TypGtTypeDeclarationBodyStyler new ].
			self updateAddOns ];
		addMainAction: 'Unknowns' translated
			icon: BrGlamorousIcons minimize
			action: [ | checker |
			checker := anAddOns stylers
				detect: [ :e | e class == TypGtCheckBodyStyler ].
			checker markUnknowns: checker markUnknowns not.
			self styleText ]
]

{ #category : #'*Typer-GToolkit' }
GtSourceCoder >> typGtRbNodeAtCursor [
	<typTypeResultAs: '{!,RBProgramNode}'>
	self
		cursorPositionDo: [ :e | 
			[ ^ self rbAST bestNodeFor: (e to: e) ]
				on: Error
				do: [ :f | f return ] ].
	^ nil
]
