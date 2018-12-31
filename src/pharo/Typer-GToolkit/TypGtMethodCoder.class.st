Class {
	#name : #TypGtMethodCoder,
	#superclass : #GtMethodCoder,
	#instVars : [
		'rbAst'
	],
	#category : #'Typer-GToolkit-Core'
}

{ #category : #actions }
TypGtMethodCoder >> browseImplementors: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node isMessage
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object:
					(TypGtCoderTypeFilter new
						type: (node "typCastAs RBMessageNode") receiver typType;
						yourself) & (GtCoderImplementorsFilter selector: (node "typCastAs RBMessageNode") selector);
				sourceElement: anEditorElement)
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> browseToTypeWithPragma: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: node typGtFiltersToTypeWithPragma;
				sourceElement: anEditorElement)
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> browseToTypeWithShadow: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: node typGtFiltersToTypeWithShadow;
				sourceElement: anEditorElement)
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> initializeAddOns [
	super initializeAddOns.
	"addOns addStyler: TypGtMethodCommentBodyStyler new."
	"addOns
		addStyler:
			(TypGtTypeCursorBodyStyler new
				coder: self;
				yourself)."
	addOns addStyler: TypGtTypeDeclarationBodyStyler new.
	addOns addStyler: TypGtCheckBodyStyler new.
	addOns
		addMainAction: 'Types' translated
		icon: BrGlamorousIcons inspect
		action: [ | declaration |
			declaration := addOns stylers anySatisfy: [ :e | e class == TypGtTypeDeclarationBodyStyler ].
			declaration
				ifTrue: [ addOns typGtRemoveStylerOfType: TypGtTypeDeclarationBodyStyler.
					addOns addStyler: TypGtTypeValueBodyStyler new ]
				ifFalse: [ addOns typGtRemoveStylerOfType: TypGtTypeValueBodyStyler.
					addOns addStyler: TypGtTypeDeclarationBodyStyler new ].
			self refreshForChanges ]
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> initializeShortcuts [
	super initializeShortcuts.
	addOns
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key t;
						build);
				action: [ :e | self typeWithPragma: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key t;
						build);
				action: [ :e | self browseToTypeWithPragma: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						key: Key h;
						build);
				action: [ :e | self typeWithShadow: e ]);
		addShortcut:
			(BlShortcut new
				combination:
					(BlKeyCombination builder
						primary;
						shift;
						key: Key h;
						build);
				action: [ :e | self browseToTypeWithShadow: e ])
]

{ #category : #'instance creation' }
TypGtMethodCoder >> newCompletionStrategy [
	^ TypGtPharoCompletionStrategy new
		coder: self;
		classOrMetaClass: self classOrMetaClass;
		yourself
]

{ #category : #styling }
TypGtMethodCoder >> newSourceStyler [
	^ TypGtCoderTextStyler forCoder: self
]

{ #category : #updating }
TypGtMethodCoder >> rbAST [
	^ rbAst ifNil: [ rbAst := super rbAST ]
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> rbNodeAtCursor [
	<typTypeResultAs: '!RBProgramNode'>
	self
		cursorPositionDo: [ :e | 
			[ ^ self rbAST bestNodeFor: (e to: e) ]
				on: Error
				do: [ :f | f return ] ].
	^ nil
]

{ #category : #'as yet unclassified' }
TypGtMethodCoder >> refreshRbAst [
	rbAst := nil.
	^ self rbAST
]

{ #category : #actions }
TypGtMethodCoder >> save [
	^ super save
		ifTrue: [ self updateMethod: self compiledMethod.
			true ]
		ifFalse: [ false ]
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> typeWithPragma: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	self rbAST
		ifNotNil: [ :e | 
			e typGtTypeWithPragma.
			methodSource := e formattedCode.
			self buildSource ]
]

{ #category : #'initialize-release' }
TypGtMethodCoder >> typeWithShadow: anEditorElement [
	<typTypeArgument: 1 as: 'BrTextEditor'>
	| node |
	node := self rbNodeAtCursor.
	node isNil
		ifTrue: [ ^ self ].
	node typGtCanType
		ifFalse: [ ^ self ].
	anEditorElement
		fireEvent:
			(GtPhlowObjectToSpawn new
				object: node typGtFiltersToTypeWithShadow;
				sourceElement: anEditorElement)
]
