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
GtSourceCoder >> typGtBrowseImplementorsAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| node |
	node := self typGtRbNodeAt: anInteger.
	node isNil
		ifTrue: [ ^ self ].
	node isMessage
		ifFalse: [ ^ self ].
	self
		notifyObjectSpawn:
			(TypGtCoderTypeFilter new
				type: node receiver typType;
				yourself) & (GtSearchImplementorsFilter selector: node selector)
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
GtSourceCoder >> typGtBrowseToTypeWithPragmaAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| node |
	node := self typGtRbNodeAt: anInteger.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	self notifyObjectSpawn: node typGtFiltersToTypeWithPragma
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
GtSourceCoder >> typGtBrowseToTypeWithShadowAt: anInteger [
	<typTypeArgument: 1 as: 'Integer'>
	| node |
	node := self typGtRbNodeAt: anInteger.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	self notifyObjectSpawn: node typGtFiltersToTypeWithShadow
]

{ #category : #'*Typer-GToolkit' }
GtSourceCoder >> typGtInitializeSourceAddOnsFor: anAst into: anAddOns [
	<gtAstCoderAddOns: 10>
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
			declaration := addOns stylers
				anySatisfy: [ :e | e class == TypGtTypeDeclarationBodyStyler ].
			declaration
				ifTrue: [ addOns
						typGtReplaceStylerOfType: TypGtTypeDeclarationBodyStyler
						with: TypGtTypeValueBodyStyler new ]
				ifFalse: [ addOns
						typGtReplaceStylerOfType: TypGtTypeValueBodyStyler
						with: TypGtTypeDeclarationBodyStyler new ].
			addOns changesDo: [ :each | self addOnChanged: each ].
			addOns clearChanges ];
		addMainAction: 'Unknowns' translated
			icon: BrGlamorousIcons minimize
			action: [ | checker |
			checker := anAddOns stylers
				detect: [ :e | e class == TypGtCheckBodyStyler ].
			checker markUnknowns: checker markUnknowns not.
			self styleText ]
]

{ #category : #'*Typer-GToolkit' }
GtSourceCoder >> typGtRbNodeAt: anInteger [
	<typTypeResultAs: '{!,RBProgramNode}'>
	^ self rbAST
		bestNodeFor: (anInteger to: anInteger)
		on: Error
		do: [ :f | f return ]
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
